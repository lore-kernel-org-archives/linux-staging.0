Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E7C149C6A
	for <linux-staging@lists.linux.dev>; Tue,  4 Jun 2024 17:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717522177; cv=none; b=FCEfzPay4pEu6wpp65QzGog/cO6bPE6GVY34gd6GCSKytqmFb5h6U0mVdAqAvyFKTpn3YphbVVBG98zvztbsM7UW1vG9QkB8RG3EKYdmisgfaT4QCiMr+X8xhDdTauhH4LUefT1ITaYEyV2/aJfvs+LjQ1RcHY46S3yHFTJK5ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717522177; c=relaxed/simple;
	bh=aoFaV2FDei+rYHIAOB9EZR+tC6EfzluzHWIx3biKuRU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Seps0RQPdPCXSFJUQS74LTm0NuGj/du+OAPBWyRWygoY5oe9gJ41gvOerH7UUWvr7I4nJAHUFrFHPhpwGufLKAlYcEFmjAzNUsCGbIDkJopF/jkpMpI1pJCFUrtnjqW2ZbWiHZFbXabz34uJchTEIg9qThUwcFo21pCmDo1aarw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=ae6wwN99; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="ae6wwN99"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1717522165; x=1718126965; i=wahrenst@gmx.net;
	bh=3Kyj7xVXKdFABvHEfIxMvuqY1IHrvscZPvjF0mLW0mw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ae6wwN99zhwo6hS72AGF4dVEhaDBcPnrM/23AQWCGib3Xx3EqnOtL9h731E7mces
	 67C3mK7QYyyo2NTfSlm3iOQT947IFsEqArRUDhWj+qAnwJD/fWsSPtE4o1eMpBSSI
	 ZcnHUCpL/6e/Sv9PZWS3tfohJiqxBTFPdKON4ilHRATYRnWDMHT0PWoq1NtjEjs6c
	 77zz4SRme7uu3DB0xyv65cxZcq4YMMFxMCHpg1bwrRN7bFaz/Q9VEnSE6Xh+LGJEg
	 iTV8etuTZVbDx18Encd4M9cdUIJlZea10pFtR3Er+VN8fhRUYPP+XQh46wZ1BbLGC
	 AKSbw0deOHs+DNremg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M1HZi-1sBmox2gMU-001xpP; Tue, 04
 Jun 2024 19:29:25 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 09/11] staging: vchiq: Move struct vchiq_config to vchiq.h
Date: Tue,  4 Jun 2024 19:29:02 +0200
Message-Id: <20240604172904.61613-10-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240604172904.61613-1-wahrenst@gmx.net>
References: <20240604172904.61613-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vaK3EOHY67WOeJOD4rbTv/Z08PFm7iD7mpWenTGCI/Vf+glXYOK
 Jyqi7zeC6Qu8gGSjmbyV0dFBsl3oz6SS/YKPCzzA1fq48hBfItdAj/OVygA4cECbJzg+tRn
 lpUiCtME9N1i2STpEuhimQPOYQExITRHNUkasPLdZIhGmtQ4P6v+yP54ILKU85jOfaPeSkY
 dm5eEVUr94otdkpUbdxZg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:EzH5oQuZgjM=;2o6JO7Oay7hlhynVIPzZoxByogp
 y8VoMIXPbtHyPlspP6XlFY7SE7zCHrXhDHt3fuvYAXSCzP373paxCPHXhDx9YiqUvXEEvrO8k
 URfR6aNm0XCgGsj3y/vwAnC6kMb7mMJ4XkmDpxMNbRzWo7LSzoGRYHv5/wcBNXEpB+Ki9jhfH
 8fAnbeMyikCUolzlqE3sLMJBsejKiStbhqye/Ldj3hWN3xVjgFD0N1VyB7EdwTUTdmMEEVjYG
 wFxMW15L7P1jHnQleNomhen7TzWQbumBkHS2YO3B4RAbKa55ab4Tu3GKOQI/xA6lX/n2JSGj6
 61xaPyDFOn9az8ts7jj5+myS7eAcarXjhMXlA44MLAqyYEN2jY8eLz3kB/F+nOwLcUjLgyMNK
 6pEzFu/gFOmtP7rfnDOa0mp8SlcrVJALuu4ltMlXxldjfvsNp14C9dSLVvzA3cbsVozArjR7U
 0D05hRee7wyIlwSu1dVOtf/Z1seNVV/XuLZ9YT6ykJw0dHwVzQSmh/jm6wuCLdNTy/rANCOxG
 qRswsdoC0IRWqPjvgMgJqhwvFQtKanBRsTICJWWV/ScL6vJIVlNl23WPsTun5l1YAaIuGQZ3m
 r8ryjTyKMDsMM0k6K2twFYhtcvDSnHi1ZbpSVoxI9k7pT9YHfQ3TdJx1D+qbYhEi0RWC7Avqd
 uky8z2qdPNPerFUBA3WYDe4978i/pyWs/m+uQk52DcsXrMo6GdzbQCb+PD1fkyKp+hnWacJsq
 wiXP529b3XTUnw49NRkI29IyM5E/R2ZhRtYxnptNnVYCDkfwS/4KPtMxh+y6sNKgygfdeqtXx
 YvdDUF9GC7sAruAtGq9zL3sCYBuTqGY7pLfBf50m7+lgs=

This struct is part of the VCHIQ userspace API, which we
don't want to break. So move the struct definition to
vchiq.h, which contains the rest of the userspace API.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 .../vc04_services/include/linux/raspberrypi/vchiq.h  | 12 ++++++++++++
 .../vc04_services/interface/vchiq_arm/vchiq_core.h   | 12 ------------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/vc04_services/include/linux/raspberrypi/vchiq=
.h b/drivers/staging/vc04_services/include/linux/raspberrypi/vchiq.h
index 6c40d8c1dde6..2e34c67966c6 100644
=2D-- a/drivers/staging/vc04_services/include/linux/raspberrypi/vchiq.h
+++ b/drivers/staging/vc04_services/include/linux/raspberrypi/vchiq.h
@@ -79,6 +79,18 @@ struct vchiq_service_params_kernel {
 	short version_min;   /* Update for incompatible changes */
 };

+struct vchiq_config {
+	unsigned int max_msg_size;
+	unsigned int bulk_threshold;	/* The message size above which it
+					 * is better to use a bulk transfer
+					 * (<=3D max_msg_size)
+					 */
+	unsigned int max_outstanding_bulks;
+	unsigned int max_services;
+	short version;      /* The version of VCHIQ */
+	short version_min;  /* The minimum compatible version of VCHIQ */
+};
+
 extern int vchiq_initialise(struct vchiq_state *state,
 			    struct vchiq_instance **pinstance);
 extern int vchiq_shutdown(struct vchiq_instance *instance);
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.=
h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index 3abcd6910f25..a83f9a5d478f 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -423,18 +423,6 @@ struct bulk_waiter {
 	int actual;
 };

-struct vchiq_config {
-	unsigned int max_msg_size;
-	unsigned int bulk_threshold;	/* The message size above which it
-					 * is better to use a bulk transfer
-					 * (<=3D max_msg_size)
-					 */
-	unsigned int max_outstanding_bulks;
-	unsigned int max_services;
-	short version;      /* The version of VCHIQ */
-	short version_min;  /* The minimum compatible version of VCHIQ */
-};
-
 extern spinlock_t bulk_waiter_spinlock;

 extern const char *
=2D-
2.34.1

