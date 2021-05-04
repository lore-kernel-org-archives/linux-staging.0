Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9ED72
	for <linux-staging@lists.linux.dev>; Tue,  4 May 2021 15:01:32 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id y26so10829098eds.4
        for <linux-staging@lists.linux.dev>; Tue, 04 May 2021 08:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kM9UiQ+FoTzRVjjWX4g2h1PjkxLvOFf2pw7JSClAePY=;
        b=Q1mQJNBw41kT8Vpk+BKpbhe4BwfI4ugJNkDVWO+vRNSPWyUnmAsUXjEMM7Sw4KhhUb
         YYcDV+l8El9zXaemZOKYhMpLARZ543i2GBXOvrhTnrPtlDKnlYDTBqULS5IIJpRaoS7C
         Cu//SSHCK+nLvBFU5Kg+t8sZGS0a9FRCCwHZdItGXeitW6WdTFf/aJHGbpsndzmltbUO
         sFq9G0+l3u8oKdEYNgkQz7PqrLdVql+E/mrGeezmJZ2BeMGwrWy8tJHpVq9XsT2pchYH
         SrF+MDdHm9DjO9FtaWOshNJgJaIwbXeLw87T0UAR6gitE5c6Uk6/4GnECnc7pAmvoTDP
         QqYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kM9UiQ+FoTzRVjjWX4g2h1PjkxLvOFf2pw7JSClAePY=;
        b=Bnr1ufzSu530viUhVHopllySaIORHqz5J/okhuckwKGxmLAt0VuL/mo1p5rG2b49ct
         nQgoZNrfk+GTxxgZBzc6mLUbZRPgiZbAvxG39y5h6W/6YO/L86zwAUhjJMvBz60r6aMq
         SymvpsYU2z5iSUz1Ef23e1OYDC/IF4/iNGuBYIrJS6pa6l363Ceq6QeiMEl37YNi7fzb
         uZU5aAsQ5OVb7TQ50Q3Q+sEe2nr6ENuOXE037tS9eidXt4JsvbJUB2qvX6kFM1Xzoczu
         OdlzmnbN5PPLJCQ1aoIiLxNGqhoTMW4fUJfHunqR2uQS6Z5qp1baZ2EbfNC/66kNbynP
         RF1A==
X-Gm-Message-State: AOAM532i9t80m1ilGhxpOHrqm2Ijjin0RbOeLKcL+SCmwVEH3sguGUVx
	+HhbUphZRj84cjw5Q18Nr8U=
X-Google-Smtp-Source: ABdhPJwUSJtP63BZoYawtKCCLEuHHoCkxLj7qDjZXDEjqOF0pr6DRr5aPsd+6lpeQc5wWbWanNIWhw==
X-Received: by 2002:a05:6402:323:: with SMTP id q3mr26891566edw.69.1620140490920;
        Tue, 04 May 2021 08:01:30 -0700 (PDT)
Received: from linux.local (host-79-52-107-152.retail.telecomitalia.it. [79.52.107.152])
        by smtp.gmail.com with ESMTPSA id nd36sm1473384ejc.21.2021.05.04.08.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 May 2021 08:01:29 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: outreachy-kernel@googlegroups.com,
	David Kershner <david.kershner@unisys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	sparmaintainer@unisys.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	Daniel Vetter <daniel@ffwll.ch>,
	Dan Carpenter <dan.carpenter@oracle.com>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v8] staging: unisys: visorhba: Convert module from IDR to XArray
Date: Tue,  4 May 2021 17:01:25 +0200
Message-Id: <20210504150125.18373-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Converted visorhba from IDR to XArray. The abstract data type XArray is
more memory-efficient, parallelizable and cache friendly. It takes
advantage of RCU to perform lookups without locking. Furthermore, IDR is
deprecated because XArray has a better (cleaner and more consistent)
API.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---

Changes from v7: Removed xa_destroy, since its insertion was due to the
misunderstanding of the reviews on v5. Removed unnecessary 'else'
clauses.
Changes from v6; Added a call to xa_destroy() that I had forgotten.
Fixed taking locks with interrupts disabled (use xa_erase_irq()).
Replaced checking for success with checking for failure. Issues detected
by Dan Carpenter and Matthew Wilcox.
Changes from v5: As suggested by Matthew Wilcox, reworded the commit
message, modified setup_scsitaskmgmt_handles() to manage and return errors,
used 'xa_limit_32b' as the range of indexes (because there is no need to
use 0 as a marker of no allocation).
Changes from v4: Fixed some issues detected by Matthew Wilcox and Fabio
Aiuto.
Changes from v3: Matthew Wilcox found that the XArray was not
initialized: now it is. Changed types handles from u64 to u32 because
they can't work as arguments of xa_alloc_irq() and u32 is enough large
for storing XArray indexes.
Changes from v2: Some residual errors from v1 were not fixed in v2. Now
they have been removed.
Changes from v1: After a first review by Matthew Wilcox, who found a
series of errors and gave suggestions on how to fix them, I rewrote a
larger part of the patch.

 .../staging/unisys/visorhba/visorhba_main.c   | 101 +++++++-----------
 1 file changed, 41 insertions(+), 60 deletions(-)

diff --git a/drivers/staging/unisys/visorhba/visorhba_main.c b/drivers/staging/unisys/visorhba/visorhba_main.c
index 4455d26f7c96..c18b987dd2b2 100644
--- a/drivers/staging/unisys/visorhba/visorhba_main.c
+++ b/drivers/staging/unisys/visorhba/visorhba_main.c
@@ -6,10 +6,10 @@
 
 #include <linux/debugfs.h>
 #include <linux/kthread.h>
-#include <linux/idr.h>
 #include <linux/module.h>
 #include <linux/seq_file.h>
 #include <linux/visorbus.h>
+#include <linux/xarray.h>
 #include <scsi/scsi.h>
 #include <scsi/scsi_host.h>
 #include <scsi/scsi_cmnd.h>
@@ -82,8 +82,7 @@ struct visorhba_devdata {
 	 * allows us to pass int handles back-and-forth between us and
 	 * iovm, instead of raw pointers
 	 */
-	struct idr idr;
-
+	struct xarray xa;
 	struct dentry *debugfs_dir;
 	struct dentry *debugfs_info;
 };
@@ -182,71 +181,48 @@ static struct uiscmdrsp *get_scsipending_cmdrsp(struct visorhba_devdata *ddata,
 	return NULL;
 }
 
-/*
- * simple_idr_get - Associate a provided pointer with an int value
- *		    1 <= value <= INT_MAX, and return this int value;
- *		    the pointer value can be obtained later by passing
- *		    this int value to idr_find()
- * @idrtable: The data object maintaining the pointer<-->int mappings
- * @p:	      The pointer value to be remembered
- * @lock:     A spinlock used when exclusive access to idrtable is needed
- *
- * Return: The id number mapped to pointer 'p', 0 on failure
- */
-static unsigned int simple_idr_get(struct idr *idrtable, void *p,
-				   spinlock_t *lock)
-{
-	int id;
-	unsigned long flags;
-
-	idr_preload(GFP_KERNEL);
-	spin_lock_irqsave(lock, flags);
-	id = idr_alloc(idrtable, p, 1, INT_MAX, GFP_NOWAIT);
-	spin_unlock_irqrestore(lock, flags);
-	idr_preload_end();
-	/* failure */
-	if (id < 0)
-		return 0;
-	/* idr_alloc() guarantees > 0 */
-	return (unsigned int)(id);
-}
-
 /*
  * setup_scsitaskmgmt_handles - Stash the necessary handles so that the
  *				completion processing logic for a taskmgmt
  *				cmd will be able to find who to wake up
  *				and where to stash the result
- * @idrtable: The data object maintaining the pointer<-->int mappings
- * @lock:     A spinlock used when exclusive access to idrtable is needed
+ * @xa:       The data object maintaining the pointer<-->int mappings
  * @cmdrsp:   Response from the IOVM
  * @event:    The event handle to associate with an id
  * @result:   The location to place the result of the event handle into
  */
-static void setup_scsitaskmgmt_handles(struct idr *idrtable, spinlock_t *lock,
-				       struct uiscmdrsp *cmdrsp,
+static int setup_scsitaskmgmt_handles(struct xarray *xa, struct uiscmdrsp *cmdrsp,
 				       wait_queue_head_t *event, int *result)
 {
-	/* specify the event that has to be triggered when this */
-	/* cmd is complete */
-	cmdrsp->scsitaskmgmt.notify_handle =
-		simple_idr_get(idrtable, event, lock);
-	cmdrsp->scsitaskmgmt.notifyresult_handle =
-		simple_idr_get(idrtable, result, lock);
+	int ret;
+	u32 id;
+
+	/* specify the event that has to be triggered when this cmd is complete */
+	ret = xa_alloc_irq(xa, &id, event, xa_limit_32b, GFP_KERNEL);
+	if (ret) 
+		return ret;
+	cmdrsp->scsitaskmgmt.notify_handle = id;
+	ret = xa_alloc_irq(xa, &id, result, xa_limit_32b, GFP_KERNEL);
+	if (ret) {
+		xa_erase_irq(xa, cmdrsp->scsitaskmgmt.notify_handle);
+		return ret;
+	} 
+	cmdrsp->scsitaskmgmt.notifyresult_handle = id;
+
+	return 0;
 }
 
 /*
  * cleanup_scsitaskmgmt_handles - Forget handles created by
  *				  setup_scsitaskmgmt_handles()
- * @idrtable: The data object maintaining the pointer<-->int mappings
+ * @xa: The data object maintaining the pointer<-->int mappings
  * @cmdrsp:   Response from the IOVM
  */
-static void cleanup_scsitaskmgmt_handles(struct idr *idrtable,
+static void cleanup_scsitaskmgmt_handles(struct xarray *xa,
 					 struct uiscmdrsp *cmdrsp)
 {
-	if (cmdrsp->scsitaskmgmt.notify_handle)
-		idr_remove(idrtable, cmdrsp->scsitaskmgmt.notify_handle);
-	if (cmdrsp->scsitaskmgmt.notifyresult_handle)
-		idr_remove(idrtable, cmdrsp->scsitaskmgmt.notifyresult_handle);
+	xa_erase_irq(xa, cmdrsp->scsitaskmgmt.notify_handle);
+	xa_erase_irq(xa, cmdrsp->scsitaskmgmt.notifyresult_handle);
 }
 
 /*
@@ -269,6 +245,7 @@ static int forward_taskmgmt_command(enum task_mgmt_types tasktype,
 	int notifyresult = 0xffff;
 	wait_queue_head_t notifyevent;
 	int scsicmd_id;
+	int ret;
 
 	if (devdata->serverdown || devdata->serverchangingstate)
 		return FAILED;
@@ -284,8 +261,14 @@ static int forward_taskmgmt_command(enum task_mgmt_types tasktype,
 
 	/* issue TASK_MGMT_ABORT_TASK */
 	cmdrsp->cmdtype = CMD_SCSITASKMGMT_TYPE;
-	setup_scsitaskmgmt_handles(&devdata->idr, &devdata->privlock, cmdrsp,
-				   &notifyevent, &notifyresult);
+
+	ret = setup_scsitaskmgmt_handles(&devdata->xa, cmdrsp,
+					 &notifyevent, &notifyresult);
+	if (ret) {
+		dev_dbg(&scsidev->sdev_gendev,
+		        "visorhba: setup_scsitaskmgmt_handles returned %d\n", ret);
+		return FAILED;
+	}
 
 	/* save destination */
 	cmdrsp->scsitaskmgmt.tasktype = tasktype;
@@ -311,14 +294,14 @@ static int forward_taskmgmt_command(enum task_mgmt_types tasktype,
 	dev_dbg(&scsidev->sdev_gendev,
 		"visorhba: taskmgmt type=%d success; result=0x%x\n",
 		 tasktype, notifyresult);
-	cleanup_scsitaskmgmt_handles(&devdata->idr, cmdrsp);
+	cleanup_scsitaskmgmt_handles(&devdata->xa, cmdrsp);
 	return SUCCESS;
 
 err_del_scsipending_ent:
 	dev_dbg(&scsidev->sdev_gendev,
 		"visorhba: taskmgmt type=%d not executed\n", tasktype);
 	del_scsipending_ent(devdata, scsicmd_id);
-	cleanup_scsitaskmgmt_handles(&devdata->idr, cmdrsp);
+	cleanup_scsitaskmgmt_handles(&devdata->xa, cmdrsp);
 	return FAILED;
 }
 
@@ -654,13 +637,13 @@ DEFINE_SHOW_ATTRIBUTE(info_debugfs);
  * Service Partition returned the result of the task management
  * command. Wake up anyone waiting for it.
  */
-static void complete_taskmgmt_command(struct idr *idrtable,
+static void complete_taskmgmt_command(struct xarray *xa,
 				      struct uiscmdrsp *cmdrsp, int result)
 {
 	wait_queue_head_t *wq =
-		idr_find(idrtable, cmdrsp->scsitaskmgmt.notify_handle);
+		xa_load(xa, cmdrsp->scsitaskmgmt.notify_handle);
 	int *scsi_result_ptr =
-		idr_find(idrtable, cmdrsp->scsitaskmgmt.notifyresult_handle);
+		xa_load(xa, cmdrsp->scsitaskmgmt.notifyresult_handle);
 	if (unlikely(!(wq && scsi_result_ptr))) {
 		pr_err("visorhba: no completion context; cmd will time out\n");
 		return;
@@ -708,7 +691,7 @@ static void visorhba_serverdown_complete(struct visorhba_devdata *devdata)
 			break;
 		case CMD_SCSITASKMGMT_TYPE:
 			cmdrsp = pendingdel->sent;
-			complete_taskmgmt_command(&devdata->idr, cmdrsp,
+			complete_taskmgmt_command(&devdata->xa, cmdrsp,
 						  TASK_MGMT_FAILED);
 			break;
 		default:
@@ -905,7 +888,7 @@ static void drain_queue(struct uiscmdrsp *cmdrsp,
 			if (!del_scsipending_ent(devdata,
 						 cmdrsp->scsitaskmgmt.handle))
 				break;
-			complete_taskmgmt_command(&devdata->idr, cmdrsp,
+			complete_taskmgmt_command(&devdata->xa, cmdrsp,
 						  cmdrsp->scsitaskmgmt.result);
 		} else if (cmdrsp->cmdtype == CMD_NOTIFYGUEST_TYPE)
 			dev_err_once(&devdata->dev->device,
@@ -1053,7 +1036,7 @@ static int visorhba_probe(struct visor_device *dev)
 	if (err)
 		goto err_debugfs_info;
 
-	idr_init(&devdata->idr);
+	xa_init(&devdata->xa);
 
 	devdata->cmdrsp = kmalloc(sizeof(*devdata->cmdrsp), GFP_ATOMIC);
 	visorbus_enable_channel_interrupts(dev);
@@ -1096,8 +1079,6 @@ static void visorhba_remove(struct visor_device *dev)
 	scsi_remove_host(scsihost);
 	scsi_host_put(scsihost);
 
-	idr_destroy(&devdata->idr);
-
 	dev_set_drvdata(&dev->device, NULL);
 	debugfs_remove(devdata->debugfs_info);
 	debugfs_remove_recursive(devdata->debugfs_dir);
-- 
2.31.1

