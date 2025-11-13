Received: from out203-205-221-192.mail.qq.com (out203-205-221-192.mail.qq.com [203.205.221.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D83B19ABDE;
	Thu, 13 Nov 2025 14:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.192
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763043131; cv=none; b=ls3cBKFxWskGQR5a+p99vi9CTmkoDXkMasDpTanfF2cDxeVD8g2PMDHGaZxW6j9baZHkMUnl6o6p/NFrhRLYKpHdjLz6fE0FDV9nAeiQTl04QSQKEtQThWa8sXmL8DGUt6Y5cEkZRBbu6eTKmovLbnh4WLVVCj3glCpnaNVJPcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763043131; c=relaxed/simple;
	bh=uicbTjW08GHV+LE9Qah/Z8LdXZk2NlBJTPPoi5GJmYQ=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=Y8EERUHxZXbVQyKrlJRhSM4sBqcAvqt7SVyTASrhcoJZVkxIBQzCc1zIi1H9PbWYE0jwGJlPXqjUmEiE6tAB7E9mzC8/GsaCVePxF0PRWR2qXhfsC0t8gCgan1l+Aln02+G1LWISjYIGd+VNxp7zpviKY3Hc1xu/NksFIr3ZEiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=NAvpwFRE; arc=none smtp.client-ip=203.205.221.192
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="NAvpwFRE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1763043126; bh=HwQ7cfgOaT6UJMocmxGitioR7yygOSm9g+QHTQhru+w=;
	h=From:To:Cc:Subject:Date;
	b=NAvpwFREivb78TBSGBMtVMmMzXR3MEe6r8lxz2ndncYUbC6l8dukx/+v0vGgnNp81
	 FTde6dN1dr5XudvMSrWKE80ef/iN2DzVlWpbJd/Edd3Vvo4vh+i/fJ7snCeF4vX+5k
	 73kuA8GGYNQh3VhM6BzeTDTTqP+JuXHgLKc8fM7Q=
Received: from cjz-VMware-Virtual-Platform ([110.176.66.153])
	by newxmesmtplogicsvrszc41-0.qq.com (NewEsmtp) with SMTP
	id 303882A8; Thu, 13 Nov 2025 22:12:03 +0800
X-QQ-mid: xmsmtpt1763043123tane858l4
Message-ID: <tencent_3725607DD617A567779DEB1BEC7C3B335208@qq.com>
X-QQ-XMAILINFO: MR/iVh5QLeiexY+Dxh4DYY0FjX8y4vEQiD8aLjqJBYvJQEG6gGJKB5ZCQiqvKM
	 NWbG3uSYGaC5gQgXk/leQydA7yfbY3P2UnZ5aYrnPBSsYcDHRI0phG9s2zL73t8t1+74uHR/9mfQ
	 GnaPPNjwMfhpHiqpt0nKlCTMcGQCYxkS4ZQkNcuTDXHTVJ6sTKd2DXSuyigK9Ekqw9qVsiRn/9Sg
	 SZq3HRBm1w629aUcP/3qxo7kOXNfMraFxYARpgJYTFfkV6/uhHMjFVSTcxBx8lJFhTkIR5HNd2Cq
	 W5pMt3IQ8NqH43cHOZSCDYsl2UVVvljHlu5rcqw5n9iBaiMPi4iACH+0dqxgx/SDqrzOX6cbDvBc
	 gz7P1h0eUJ5zdgaf2fIh407IyMNPU16nEwWOHm1NcS5ikD91KSzv18GJpn8rNR25v8SoHT/v+RW4
	 3kSCSYIxYjKXvwMLx9S4lpibBXcx9BFSsG55A7wF9cTpKiUCJzr0RqGMx/rx7uYZAti3Mdyd/CvE
	 W0FfqiPztL1cPsKA/rigY3KhJ9WLx1FjF3hNIpUpjAnZVEXcJVJ6BizUhG7oug0WT0mCxw77Py27
	 aB2L1euYs5AKiP9JkFKOKoGX41azIyecnHA1WG67+IwcegcU6IzbD+rQDWIV6xmspfAC0q+NPUwj
	 pCyC5K+KOQbdFaMiFTBAG5cd0xx8vT4VRCMI4X50pH9JwOBZ8OZOCUuWRFCKVnTw3ZISiEy0PUGU
	 7lTeV+hRz3VyAJFupPrtFpZzCc4WmtHpEX5mHtBeNTgFGWNqQk+c2yZVeQ2cqPRzjCmsetbipD7L
	 EafJ6ib15LwGZP2+tsJys8ks4mbi6fTfUraewIa0gLFfFt6zFcnzmew04+GkhpxIEjX09Lb2/66I
	 iX9x/ywseEMMUu7JryEirHUaOO5kFtlDPHg4d9hux+NzNQZRQwh3oyo7ZgsySSpe3tngwc7Gp/k6
	 jYfxoB52Cg3wzkVH0SmjJVSllc1p/lmQNFV/R1H7XVHfGY6jJ+V8PZ4amEVWCveMxKP0BAHacHF0
	 qcySXxe4F89xCupkXixHlHwl4GTDEqqHzaya4tBQ5u6N5c26Pu24t4DJodUSo=
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
From: Chang Junzheng <guagua210311@qq.com>
To: outreachy@lists.linux.dev
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	guagua210311@qq.com,
	Chang Junzheng <guagua210311@outlook.com>
Subject: [PATCH v2] staging: greybus: audio_manager_module: make envp array static const
Date: Thu, 13 Nov 2025 22:12:00 +0800
X-OQ-MSGID: <20251113141200.3812-1-guagua210311@qq.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chang Junzheng <guagua210311@outlook.com>

Fix checkpatch.pl warning by changing envp array declaration to
static const char * const. This improves code safety and follows
kernel coding style recommendations.

Signed-off-by: Chang Junzheng <guagua210311@qq.com>
Changes in v2:
- Restored original indentation of array elements
- Only changed the array declaration as originally intended
---
 drivers/staging/greybus/audio_manager_module.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
index 4a4dfb42f50f..78013d59fc93 100644
--- a/drivers/staging/greybus/audio_manager_module.c
+++ b/drivers/staging/greybus/audio_manager_module.c
@@ -159,14 +159,14 @@ static void send_add_uevent(struct gb_audio_manager_module *module)
 	char ip_devices_string[64];
 	char op_devices_string[64];
 
-	char *envp[] = {
-		name_string,
-		vid_string,
-		pid_string,
-		intf_id_string,
-		ip_devices_string,
-		op_devices_string,
-		NULL
+	static const char * const envp[] = {
+	name_string,
+	vid_string,
+	pid_string,
+	intf_id_string,
+	ip_devices_string,
+	op_devices_string,
+	NULL
 	};
 
 	snprintf(name_string, 128, "NAME=%s", module->desc.name);
-- 
2.43.0

