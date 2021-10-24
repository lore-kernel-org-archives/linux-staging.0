Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9812E2CA0
	for <linux-staging@lists.linux.dev>; Sun, 24 Oct 2021 21:25:53 +0000 (UTC)
Received: by mail-ua1-f43.google.com with SMTP id q13so18278213uaq.2
        for <linux-staging@lists.linux.dev>; Sun, 24 Oct 2021 14:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CsYmpFKWOiWQ03jQad0Q3T5GnVeBFD+8qIGd8B/YeyY=;
        b=JPAwHuqEg5OBJ3gqusFUTC8GAHeSKNv+lB1wjHmRjh8VCr9e9tjJFqc5tTL8u10NoD
         QzM3RIhX3qBj6XF6/UtIp/dTkt3cmnit+rvRoKwaJqQH73mlUqOzwzOyEHMJwbY/F+1U
         u6lCo6nphuGSU54ykEzL+fByO/50ZRB6Ecaeo62E5gvCVvmEkO/AGM9ZLZW1m3BelRVU
         GEhqPUCYprL1aHyZUC7LON0oxinDh2RccwDKe0l/WHFkhKF7gLWZ1xwfyBLbgTMgupr8
         MNGOeAO/x2PxXQ55wiO0bWzplHd3hEDg0RvLK95k5FuuqbjSEdg8xbAixZx8ZxbF0XcL
         Vd7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CsYmpFKWOiWQ03jQad0Q3T5GnVeBFD+8qIGd8B/YeyY=;
        b=w8EZI4R+a9hlYMaAfC/KucpUNI2gxiLLTSZKTZdwOM6WcFHqXWdte5VSrYwsVay2hy
         tHnApT6T6yu18QNUrOX6q9FA4afjwHginbfHv0X8dVl3mBGaICWiqNxhDA3Z8DeRjj7J
         hPMuFLBaZdS1/3mkkOeCapw3mz/EjpjKHnGgw5+1R0EBn4HsM/dT/ebjt4qTzrDr/xTm
         605Lh5NFFoIvlSFuifSsWxgnIKYp33f3in2mQobb+fVMsY850yu4lsH61STB96870MS3
         aX5VBcwBXQJ+wy/DlROgAPWm0KssvrI5Gxoe8AYYOr656Ba9GnRFcOUhMExoB4koxkol
         20KA==
X-Gm-Message-State: AOAM531+VnGHaqB37Y+sYLdl7f3ISVXTg7rCGR4E4TAIp+Crq6csJXDs
	L/CfnfrWndsJXJJXafzCL3TbFoS+R7AnhA==
X-Google-Smtp-Source: ABdhPJw3Z50PnALm/Vittr9/gmw0CgP7YCwh9FKl6QYIV10vcyW9unkPO+zMDXnqpXBuGQuvXjaxhg==
X-Received: by 2002:a05:6102:21b8:: with SMTP id i24mr355424vsb.51.1635110752482;
        Sun, 24 Oct 2021 14:25:52 -0700 (PDT)
Received: from localhost.localdomain ([191.83.215.63])
        by smtp.gmail.com with ESMTPSA id 45sm8847869uaq.8.2021.10.24.14.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Oct 2021 14:25:52 -0700 (PDT)
From: Gaston Gonzalez <gascoar@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	nsaenz@kernel.org,
	stefan.wahren@i2se.com,
	arnd@arndb.de,
	dan.carpenter@oracle.com,
	ojaswin98@gmail.com,
	amarjargal16@gmail.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	gascoar@gmail.com
Subject: [PATCH v2 4/8] staging: vchiq_core.h: use preferred kernel types
Date: Sun, 24 Oct 2021 18:25:20 -0300
Message-Id: <20211024212524.370078-5-gascoar@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211024212524.370078-1-gascoar@gmail.com>
References: <20211024212524.370078-1-gascoar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change types from uint32_t and uint64_t to the preferred ones u32 and
u64.

Reported by checkpatch.pl, with the exception of the one in function
vchiq_log_dump_mem().

Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_core.h   | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index 383c3bcf787e..a107c72ce3a6 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -74,7 +74,7 @@
 	((fourcc) >>  8) & 0xff, \
 	(fourcc) & 0xff
 
-typedef uint32_t BITSET_T;
+typedef u32 BITSET_T;
 
 static_assert((sizeof(BITSET_T) * 8) == 32);
 
@@ -231,10 +231,10 @@ struct vchiq_service {
 		int bulk_tx_count;
 		int bulk_rx_count;
 		int bulk_aborted_count;
-		uint64_t ctrl_tx_bytes;
-		uint64_t ctrl_rx_bytes;
-		uint64_t bulk_tx_bytes;
-		uint64_t bulk_rx_bytes;
+		u64 ctrl_tx_bytes;
+		u64 ctrl_rx_bytes;
+		u64 bulk_tx_bytes;
+		u64 bulk_rx_bytes;
 	} stats;
 
 	int msg_queue_read;
@@ -622,7 +622,7 @@ extern void
 vchiq_set_conn_state(struct vchiq_state *state, enum vchiq_connstate newstate);
 
 extern void
-vchiq_log_dump_mem(const char *label, uint32_t addr, const void *void_mem, size_t num_bytes);
+vchiq_log_dump_mem(const char *label, u32 addr, const void *void_mem, size_t num_bytes);
 
 extern enum vchiq_status vchiq_remove_service(unsigned int service);
 
-- 
2.33.1

