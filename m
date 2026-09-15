Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804AE36897F
	for <linux-staging@lists.linux.dev>; Tue, 15 Sep 2026 14:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789481332; cv=none; b=r7CHN51z9ibTjR15GIMf+sWMaT2y6+7O5s03vhqPVXDqYmyLM6IUhmh3qeC45241o7ir2dzKHK6fDYf4d6lGuL8gfjOCAVftqIztVl1AF4aGSVBOJDp2usa51LIG3yJA8WNzy7Bk2suSNaOpJnrSrNBkjHqWwK97ORq/s6CtEz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789481332; c=relaxed/simple;
	bh=bx4DSXNCIULw2FUncUSRqfYmz85DyjyUcd9/xdHxYPE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FHwrd5AZRJvjJ2S1hY1jmXUoR5t6j42zGFSh1xrXnGy/MQlajkW14kfccjCuBaIG/020Y/QEFlMGnBqBeYAD9FRTe8wicvXrFmPdsojNzaEu2fgwT+5MRzPRdNJYzGh1EmbNXOU1/7NDu1V+Oc8Srdm+ku/L5u7g2QB9L9eLCbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mQHB2gh6; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mQHB2gh6"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1ceb47d55so456801a12.1
        for <linux-staging@lists.linux.dev>; Tue, 15 Sep 2026 07:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789481331; x=1790086131; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dfdpMft+Taz5w+O+/iQK+gDuE29kZk9QP9FYpppeBn4=;
        b=mQHB2gh6YpcTYKIuOsJPlmSl/UfMt5bpp1vSFvAkCHN7dH2VzM8spJ8tSP+l1XF3ab
         zh3u9RH5tikK+7TW3qxsO4rNaBk9XtFN54PnXrwLneNfCLgjSXI68s2DrDfWIh78mvAk
         qQUUi0MJAKkismLhT8paIHNd/2b4Gvgj1tTWp4mrF45tAKHjdjmNP9+FEa4z40azOmba
         8nTqM4T0mIZW9hK84QKduUDtSzQVHvo/Kkp6gmw9pen0XtM+iSBaW8JXLjFeeXwb5Ff1
         SMCpLn0wuVstdV0SppO/RcDWIjEbN7irpvD3rb0k4fYr0Qywp1esQQK6+XRzQQBu+9Yu
         mvkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789481331; x=1790086131;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dfdpMft+Taz5w+O+/iQK+gDuE29kZk9QP9FYpppeBn4=;
        b=vxtzlqj00j0v3LGopawgQgE0ZaH9vpzH0pxgx13OFMDQRBz/5CZ12xnDuFYmQMZXpG
         jUrANw4Jngjvb0227b31nZ3RNJGTwtFSRPMfn/YSi0iBC1311EbbS3+YRa4enoVs7yup
         x/Y4ycDv+8d5rm540h5V5Sbj5BVXtOLIHpp05bPFJq/3quXQIvlEUgLD7jI8lFcxyI3o
         REvfD0eSCzgICW5CyT3rd7dZHwxdof+aJMmPKuxQqMRtpuNatQaoMfeiee0b2N8ziqgr
         7BuqtWDwnMKADmcSOddeNNv63IxyfSHNAwOshI5hcCMi3c4sEyrCMcGDK+eFvN2pHmOj
         2M0g==
X-Forwarded-Encrypted: i=1; AKwUvByQlGqr68Ne0gDeUBkuXW0CsVxE7EGfOIp3DXcvQsH7RbW6H+kgG/ecMGtA/+x+vOrbKj7qb8MQg0nvT0OR@lists.linux.dev
X-Gm-Message-State: AFuF++nIvK+P7YWIqT0B27GcGMaXM5xQ2EWf0SBDmxl2YhcIDerBPrvD
	lJ9H2cEVwpZTmcq1c3zk9WNU2Zhwv3z0Lj9mlGOf7NPhqbhDrj8Ce9t1
X-Gm-Gg: AYBFou2AOm1lRWuoSRx9x53qjktkWAmjIvAXmcPBIL9SaO4wTgBEVch0cduijp9WMwF
	/ouDpIRRy6V0hRyRW/DtvVhTpnuzCnW1iDHJVJoL+3j6HS3+PbHYWI/xCafMJjvT5Vt+eVuaz2N
	MYeuzcgO6OGCXgUnOfVtXpfpBSgm0hRDOgO85az57vHtGATZ5DxaSEoivXRlVSOfg4bv2t4sUNw
	RKER0SD4g4iMasro+GYuiRIDmvL+BRkPyw+cDMGPXIgjsf+GXlECkWX6u/AWFE3e/IaSAfTljzY
	RKZ9LOlv6Qnp6kP7QFRFjC5x1EM8M0S5TU0Q1ncufCRhwafkO9mMNr5DrtjxIurvTrOtp2ypHYf
	in2k2C28G7FtOvKswDwnth7JKg7XLbAIHAch4a+wBbeUR0v0q2pSSeisC0oKjZXQ4bSTX1al49V
	yxKodsR8D19B65HP65PVp9xZM+yZ26jvMO+ae8pxJeMI9c9Ex4BL4UuaGIvWyCbDWwfmO0T0COQ
	BgMzabjP2N7lgRekI7iNXIj8ne6y7NJGLVWABw=
X-Received: by 2002:a17:90b:5646:b0:390:84db:888e with SMTP id 98e67ed59e1d1-39dfe097622mr4709299a91.7.1789481330561;
        Tue, 15 Sep 2026 07:08:50 -0700 (PDT)
Received: from localhost ([2401:4900:1c6f:fd8f:123a:b4ef:d8b:c604])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdd58b30sm5863118a91.11.2026.09.15.07.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 07:08:50 -0700 (PDT)
From: Punnay Sharma <punnaysharma805@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] media: atomisp: ov2722: Return after failed pad initialization
Date: Tue, 15 Sep 2026 19:38:28 +0530
Message-ID: <20260915140828.25537-1-punnaysharma805@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If media_entity_pads_init() fails, ov2722_probe() calls
ov2722_remove(), which frees the device structure. The probe then
continues into atomisp_register_i2c_module() with a pointer to the
freed subdevice, causing a use-after-free.

Return the original error immediately after cleanup to prevent
registration from accessing the freed device.

Signed-off-by: Punnay Sharma <punnaysharma805@gmail.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-ov2722.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
index 2c41c496daa6..0748247ca42c 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
@@ -979,8 +979,10 @@ static int ov2722_probe(struct i2c_client *client)
 	dev->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
 
 	ret = media_entity_pads_init(&dev->sd.entity, 1, &dev->pad);
-	if (ret)
+	if (ret) {
 		ov2722_remove(client);
+		return ret;
+	}
 
 	return atomisp_register_i2c_module(&dev->sd, ovpdev);
 
-- 
2.55.0

