Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F58324501B
	for <linux-staging@lists.linux.dev>; Wed, 25 Feb 2026 07:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772003550; cv=none; b=c0zHLkrrYSrsOBbQKq6dB0DoWHSB6JX9MCqpcIGOXRAKqbWui4S9iMXyrxqmCR/2pkJgFkLelsr+dL3O936ZcVdy+pzCTf1kCbXPP+/0cCpDrie9aQYUMkPV5hLR/0+46kgtknCbbjtxwPI+fIexSbYEgJIwvWs6aGY0jUcFyik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772003550; c=relaxed/simple;
	bh=LmzOPvwE/PLKIOCb0wKClC692CywgoPgBDM1rpxJPwg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZJFNZi/1eAv3k2tGuwcJs+c3kBslon2Gz+D10Dzcp07u30h1slM+wGgMBl9VpXiTdicPqnYo4zxpHs9b+UoDtjYvUit2lZ7VtCvzS0xyLtbPd/SfqLnMNRS7Jzrj5XU9tIqqHa7Rg8Y35qD7Sf8L+E7v/73Lp4drO3G6Z25gTS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K4m1BrlS; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K4m1BrlS"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c6e3e4e7388so2141010a12.1
        for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 23:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772003548; x=1772608348; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q1YxipkLf0FnwbRouoqtGjqWkQYlfLCHRzYlNn0OsgA=;
        b=K4m1BrlSEFzIRAbEAfKbIewgITlumH+FKYg4KPL7yER7XzJL1tWFNNVo5J1z3fXScT
         hYNi9DbCqygxamyD14hTKxvxJvmoaBTS2pZ6NKPi2mzxOY5f3M1xSoRCtJ3AmB2AvGeI
         kwqSouJjUwc7CL4HciRLAAJ5R1FzVghU55xC56NkpOqjf7bfP6xKVJTSftqB4ckt/h7C
         VHrxNRNNWWsW0Z2HAeGorMg4icdypFjeyACUV4b81aO1dY+My0ZcykC1oizaCFCreZDv
         WC6nftVtt0vnfxhWhwlAflaVQZaUwS7OTUCOoOPpSJV/FEaL/PhK/E7K1wa8eVAI4Ntn
         qirQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772003548; x=1772608348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q1YxipkLf0FnwbRouoqtGjqWkQYlfLCHRzYlNn0OsgA=;
        b=OH91fXZ1BZNtVQgio/3XVBOinxxKXz0epSwf6kkGGwF271sF1DTWTdqtznx0S9+r30
         IewHYvGyLR+hgw5M192nc5xGTxKtPgJNqsVRvm7yZGHto5rJbHac7HG3LIwVkKWBkshd
         RSy1a9FZuEfQZHiOQslAfjsLhCZTGz5V4kr/emxpxDqTjHZArozrC87X7Tmuyfo9tJYc
         kFGOZdDmHAeQHCWYucf/9d/aRixjTVNSaZePGxzjSrK/WqtWHpzhkRDePZ1ydjuFScEs
         wqVCSNRaUehupv8Ecky060XfLmCIHlyW4QZtCLWhZ0sMPg9Box1tMUdNj822Q/iyzA9Q
         2kOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXD0pJ5R43lwgqTLIn6uM0KGSaGc1P/qtO41FV6xfvKyjb0vRSKMzVfhbdXgRF2LKlMY0WrUHGN12GNUOh2@lists.linux.dev
X-Gm-Message-State: AOJu0YxBXzODzWPV+K2B1BycyBjkRXJRNqYCSECMyi4szZJyW5BvwEKe
	N4DnEB08pjrTAzAogT+JS5dYKZmn+CB8OdLDMrIU2nScitiwgn5eb1zv
X-Gm-Gg: ATEYQzxQ7HT26n9G6L4Jmk45dmH+DqZGaYh2lWLYBH+U91UknwTunTweCWDNhlvE2Pb
	+CLdn5qDNhWcpgkObwZx0lKKuPDF4z0cdItT/FLZ20/Wa0YkScpPZCoHlaPNqEPqj+QjDJv8/vE
	ekcIr7q/G2K4Jk2SZ7eMisP/nPOfAvCEddKgon4+CAkAobI26H9buxv6zX2rHswJyjICiWUL6v/
	dQdG8TRh7e5FkmjT36iT5qvggdOsj2S21WK1gt/5W82OTXPDjWx4xTLxcrz2fHz7S1ffgIND2Rb
	JEjfEqXBx7RhnI/GFkathwrGxegGFNInvPelLbeCOS81EC9LxhCVgeDn5wW3vxxJP2EUXlThHXn
	3HZ1epgfO6zSOYhw28gTmmch4v5e2iegZmI7ED4aJhZXB/gknggNsXU28icGYv+V6M7mT9/dEip
	c/Y70wRHF1dz8CCiwf56zLWt8v6eqCaJlS9w==
X-Received: by 2002:a17:90b:5747:b0:33b:bed8:891c with SMTP id 98e67ed59e1d1-358ae8c6c31mr13644861a91.23.1772003548280;
        Tue, 24 Feb 2026 23:12:28 -0800 (PST)
Received: from fedora ([2409:40e5:116b:88d4:3795:8a9b:7eb9:b495])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35912fe6bc8sm381401a91.5.2026.02.24.23.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 23:12:27 -0800 (PST)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: gregkh@linuxfoundation.org
Cc: vaibhav.sr@gmail.com,
	mgreer@animalcreek.com,
	johan@kernel.org,
	elder@kernel.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Subject: [PATCH v4] staging: greybus: audio: Use sysfs_emit in show functions
Date: Wed, 25 Feb 2026 12:42:12 +0530
Message-ID: <20260225071212.9050-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor sprintf to sysfs_emit in all show functions of the greybus
audio manager module. This follows the standard kernel practice of
using sysfs_emit for sysfs attributes.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

---
v4:
 - Remove \n additions, keep format strings identical to originals.

v3:
 - Add patch history below the --- line as requested by Greg KH.

v2:
 - Add missing Signed-off-by line.
 - Wrap commit message at 72 characters.
---
 drivers/staging/greybus/audio_manager_module.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
index e87b82ca6..f9dd9269c 100644
--- a/drivers/staging/greybus/audio_manager_module.c
+++ b/drivers/staging/greybus/audio_manager_module.c
@@ -76,7 +76,7 @@ static void gb_audio_module_release(struct kobject *kobj)
 static ssize_t gb_audio_module_name_show(struct gb_audio_manager_module *module,
 					 struct gb_audio_manager_module_attribute *attr, char *buf)
 {
-	return sprintf(buf, "%s", module->desc.name);
+	return sysfs_emit(buf, "%s", module->desc.name);
 }
 
 static struct gb_audio_manager_module_attribute gb_audio_module_name_attribute =
@@ -85,7 +85,7 @@ static struct gb_audio_manager_module_attribute gb_audio_module_name_attribute =
 static ssize_t gb_audio_module_vid_show(struct gb_audio_manager_module *module,
 					struct gb_audio_manager_module_attribute *attr, char *buf)
 {
-	return sprintf(buf, "%d", module->desc.vid);
+	return sysfs_emit(buf, "%d", module->desc.vid);
 }
 
 static struct gb_audio_manager_module_attribute gb_audio_module_vid_attribute =
@@ -94,7 +94,7 @@ static struct gb_audio_manager_module_attribute gb_audio_module_vid_attribute =
 static ssize_t gb_audio_module_pid_show(struct gb_audio_manager_module *module,
 					struct gb_audio_manager_module_attribute *attr, char *buf)
 {
-	return sprintf(buf, "%d", module->desc.pid);
+	return sysfs_emit(buf, "%d", module->desc.pid);
 }
 
 static struct gb_audio_manager_module_attribute gb_audio_module_pid_attribute =
@@ -104,7 +104,7 @@ static ssize_t gb_audio_module_intf_id_show(struct gb_audio_manager_module *modu
 					    struct gb_audio_manager_module_attribute *attr,
 					    char *buf)
 {
-	return sprintf(buf, "%d", module->desc.intf_id);
+	return sysfs_emit(buf, "%d", module->desc.intf_id);
 }
 
 static struct gb_audio_manager_module_attribute
@@ -115,7 +115,7 @@ static ssize_t gb_audio_module_ip_devices_show(struct gb_audio_manager_module *m
 					       struct gb_audio_manager_module_attribute *attr,
 					       char *buf)
 {
-	return sprintf(buf, "0x%X", module->desc.ip_devices);
+	return sysfs_emit(buf, "0x%X", module->desc.ip_devices);
 }
 
 static struct gb_audio_manager_module_attribute
@@ -126,7 +126,7 @@ static ssize_t gb_audio_module_op_devices_show(struct gb_audio_manager_module *m
 					       struct gb_audio_manager_module_attribute *attr,
 					       char *buf)
 {
-	return sprintf(buf, "0x%X", module->desc.op_devices);
+	return sysfs_emit(buf, "0x%X", module->desc.op_devices);
 }
 
 static struct gb_audio_manager_module_attribute
-- 
2.53.0

