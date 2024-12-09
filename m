Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9BE198851
	for <linux-staging@lists.linux.dev>; Mon,  9 Dec 2024 19:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733772340; cv=none; b=FM67ethiQZ3FErpl0TpWEtgFsC+QLOkAZ0XWLE8h8YMoI2J3pSppEtgXVnG0V9gcxJhQ2Zxv9sAzVzGxXP3jRaVuRxC91BWILIZR2ydB2Ck8wqNE0J5Zojn02Iq8COams8HG1wnJG73Sfo5CoTU2V2XSlb7pHuxFyb3mDEVHV5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733772340; c=relaxed/simple;
	bh=QTPQ1DyM59FTFwoOCCInfTij+St4lWshfJMO2MNF9Jk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iK9r95J+aH4AEzl6HmeVzu8bxPvs0wL6iZOgRSftoDo9dBqqe3dzZgeBVR0VzYAXEjplfgb2Qcbwj86Yiab2O34HJ+hj02vm1wb5Qu3XbFdVcjWS3K1rV9pCtopGI+qNSNK3Vn++t2cJOjYz8G/JLzD/H0b0o1KAXkg4fDqSzYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Hw5HQ+Rd; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Hw5HQ+Rd"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6d8d44e177cso44947156d6.1
        for <linux-staging@lists.linux.dev>; Mon, 09 Dec 2024 11:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733772337; x=1734377137; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ldrzuJki4Bob493jggNorXy/00Sxo1CNpTeJmfaThng=;
        b=Hw5HQ+RdXNnBhY98fJ+i5jdFgl1NqxYKCe3HROURXphptaWweVMyz2lrUmyQ7fB+wW
         Gv29XX++fIR47/1iEaeCF9GJTfE9fbniskeQLvssVkv/NpF8Tnn1/CvcPTIV/7G1FzGV
         FMvswDhDSO3ouypYh+dZPSCBA4vG6bmDQpL9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733772337; x=1734377137;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ldrzuJki4Bob493jggNorXy/00Sxo1CNpTeJmfaThng=;
        b=VGGn8XLJw3PBEA9a5pheJZv02yGcPPKW12EZ5ByKtit/Kr3yDziBAcymcx8sYRB4JB
         XQSLHNpYj3KDItsIpptHJN3DvG1xpRzSTl5qQqmDC3n7EY9fO+I13K2aVRStafHHCVOo
         DjZleycQTvCGlgTfigkTVcXWjtjNBjnH656ROKbAsV859Lf2oORh0u/p4Py197sBJ/Cr
         6LYbdgqnb9oAVOGzqQj+4+o/Hs0XlrNE8uxe9c3GNb6+fEsY2w9oKs2hpyOu3+TZsmLY
         raIAB8PYIdDdBJvXKs2OMJrQB9tL0druYCIJT7gJEDrYlFok1uAmjYaBn0vnvfNTkRUz
         WLkw==
X-Forwarded-Encrypted: i=1; AJvYcCU2WTOXdY3sr6B/wsT7Gff69l9eKYJjwAQCuk5S3TaWZvpYTVGkrAsD38/UyZ6XlHncTEq6GIkoXYWfm95h@lists.linux.dev
X-Gm-Message-State: AOJu0YxW+qFelBFu0UQ5DQfW0q76JGJ0YGj8SPsbo1UteXvUuWc23Uhv
	JXWKBxkTVatLVuDE2Wefn88Ci5l6VF5WIpcNeiwV/4DBPD6Yg47i6beCCNl8UA==
X-Gm-Gg: ASbGncvM+glulDtKuYXTnkr+pUpfCiokxVB5pAu7bfBDhHKT1qYnPGclRJY6TvCAkIv
	MUEtE/2i3F+MYQAM3xORO0+Lqz0DFM/c/zf/S0Gyw3kEdjxSfF2VTO5P+AC4EkCEctAlYSOKu5A
	vjjddeF6rYhx24tzfsmJg+Zo34MIVyPWEygisOszjILl1eZeZT6ZCSL3CM2xcydMrSym7+qFXzc
	NWqJbNjB9puzSd1YUIpXTKGb8BoGEkdWWDB7ExQFxux7SKeRhTA4lc/o5rgSqpialDuSK9FJ9Du
	RWw05J7/oJLDyxID+chklVjw
X-Google-Smtp-Source: AGHT+IFHW0/0qUHG8qwMzURyamcTUPmaaCxTzs+9Cce4VEgPbFPUYI69YdWNaUrMvMWP46LE5wus3A==
X-Received: by 2002:a05:6214:27c2:b0:6d9:1532:d8fc with SMTP id 6a1803df08f44-6d9212c7c65mr9382816d6.11.1733772337147;
        Mon, 09 Dec 2024 11:25:37 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b6cc1cf6fesm217433385a.102.2024.12.09.11.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 11:25:36 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 09 Dec 2024 19:25:34 +0000
Subject: [PATCH 03/10] media: pvrusb2: Remove g/s_ctrl callbacks
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241209-queryctrl-v1-3-deff7acfcdcb@chromium.org>
References: <20241209-queryctrl-v1-0-deff7acfcdcb@chromium.org>
In-Reply-To: <20241209-queryctrl-v1-0-deff7acfcdcb@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Mike Isely <isely@pobox.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

The ioctl helpers can emulate g/s_ctrl with g/s_ext_ctrl. Simplify the
code.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/pvrusb2/pvrusb2-v4l2.c | 27 ---------------------------
 1 file changed, 27 deletions(-)

diff --git a/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c b/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
index 7c8be6a0cf7c..ad38e1240541 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
@@ -574,31 +574,6 @@ static int pvr2_querymenu(struct file *file, void *priv, struct v4l2_querymenu *
 	return ret;
 }
 
-static int pvr2_g_ctrl(struct file *file, void *priv, struct v4l2_control *vc)
-{
-	struct pvr2_v4l2_fh *fh = file->private_data;
-	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
-	int val = 0;
-	int ret;
-
-	ret = pvr2_ctrl_get_value(pvr2_hdw_get_ctrl_v4l(hdw, vc->id),
-			&val);
-	vc->value = val;
-	return ret;
-}
-
-static int pvr2_s_ctrl(struct file *file, void *priv, struct v4l2_control *vc)
-{
-	struct pvr2_v4l2_fh *fh = file->private_data;
-	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
-	int ret;
-
-	ret = pvr2_ctrl_set_value(pvr2_hdw_get_ctrl_v4l(hdw, vc->id),
-			vc->value);
-	pvr2_hdw_commit_ctl(hdw);
-	return ret;
-}
-
 static int pvr2_g_ext_ctrls(struct file *file, void *priv,
 					struct v4l2_ext_controls *ctls)
 {
@@ -817,8 +792,6 @@ static const struct v4l2_ioctl_ops pvr2_ioctl_ops = {
 	.vidioc_streamoff		    = pvr2_streamoff,
 	.vidioc_query_ext_ctrl		    = pvr2_query_ext_ctrl,
 	.vidioc_querymenu		    = pvr2_querymenu,
-	.vidioc_g_ctrl			    = pvr2_g_ctrl,
-	.vidioc_s_ctrl			    = pvr2_s_ctrl,
 	.vidioc_g_ext_ctrls		    = pvr2_g_ext_ctrls,
 	.vidioc_s_ext_ctrls		    = pvr2_s_ext_ctrls,
 	.vidioc_try_ext_ctrls		    = pvr2_try_ext_ctrls,

-- 
2.47.0.338.g60cca15819-goog

