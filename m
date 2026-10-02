Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B231A45D1B9
	for <linux-staging@lists.linux.dev>; Fri,  2 Oct 2026 08:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790930155; cv=pass; b=CH+Et1Uh+NKqMH4UfOhe3d4y4bJnbrzoYD/Bp4zVgr/km7y1YVorp2y71/XHHrfRXjJ1cReUB5mr9snAzrAF31Ipnn/mSnzE5b+MqrovWvaegBSqfyM1FrqvrgdWF5YeCYx4R+XtuRRI2VcgxKIQVVxYtfU8CLbW5wCSg+sHx74=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790930155; c=relaxed/simple;
	bh=5Lf40F4jqAJa6SoZeleXwYqCtcr/IFf80+LzR5G4iws=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p/ZHGW/qXaOrdk5SKlBTf7u0L2YbiWTglGM6cCD83wcCSXLOQUxVeO+5RATEe5W10F6ye9O2TTIrFovibjNiwAnMvJODICt+vyAspfE1Bv/lfxBQv3brmhhHQ2ACo6DGH3RP2iv6UVoamvVxXQPoogQOpoE6+e0u7jjht7ALzxk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GoHvo2j+; arc=pass smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GoHvo2j+"
Received: by mail-oo2-f43.google.com with SMTP id 46e09a7af769-81b026208d8so3270727a34.3
        for <linux-staging@lists.linux.dev>; Fri, 02 Oct 2026 01:35:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790930152; cv=none;
        d=google.com; s=arc-20260327;
        b=FjjkpOx1QgR6eT1zZTd+awEpnKhcF2CuhTCajKZ4txSHnfP7bonGF6OAxIEKZFD5iY
         +dQJxA6KAdySeL5uQUW/ZOP0WlH8ShH/aoYo8Wkt59sJ/WUM1unBeky1fVWavdnS+CnR
         SvYttWrJTk4qBnrGAM16gqHepmBIp13VJxxXf5IFp184GXQ+RhRTp/GLoE5XfXk4bfmn
         JkXnT+7Q2/WlUsF03lwfikW/LRArC8lZ/sikW34cjyyNAoxxXOs6f7afP31DVSKQ7Ysc
         3vXHDnAn+H1/9btteYaLnKKtkjNdJmAvRLn2zgxcmcpWbS1yeYukmD+dWrbpqXeCTVhK
         NzqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=ixm9wnTRw/IMUlrBZgFwX0kWno7rJE4TeERGvWa7BZE=;
        fh=hpMOQPdJhY5RSfRBLYSv1uYWuOUwsPgGvSMxFbPJXnY=;
        b=GVxB5zcG5iqB2lkLtnWC/F3RLgoy14jfh5l44Xh7aloHDxr0rejLl563aP/k1hxSJG
         IIg4CoytoOy8sud28DW4JX9cWBzsBLMjOWd2/0ZlB4egOb8i+7el5vB3UDMQT3PyyxbI
         5xy2juadG6o4HHpsIFPo6Xd9ylyo1IN1zoCjUYR/XCqNOI6LNzmF0iOhkBowGFD2aR+/
         9CkFTWJyRtcFSbWc1NLk7L6eiWe0p3UJZY4ZcwbZSeOsAIZAhQUiVHpXCSJLdDq4C5CJ
         nO5xD5QiBO6QqUFT9E1uzy5gwThOYB0iDzpEEir8Jp8a934BHCW2Z14kyp8OmTdJ4OLT
         7Diw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790930152; x=1791534952; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ixm9wnTRw/IMUlrBZgFwX0kWno7rJE4TeERGvWa7BZE=;
        b=GoHvo2j+HmWB3KC3tJwKS9QHDUGttIHScf8TPue2SIezJOz1XOv9Bugtwgh6c+7WDq
         v5X0ZknINgkUZzUy+gUCVMc6udrj4/cjC8Yx7njS/XSS4RJu/0dPXybG7IlB93uMgZYJ
         IQ73h3J4Lk6WeRKB/OMmqvVyC4uHOY1cLDtLXrw4bjKehhzZ/Y+I1ekJkpWpJfLXK3yx
         9IHCy6y7rpvGeNEeSDH7uwCpwWBrKomR53xZ2jhmzaimnA4jr0gxdcSk8rWlPV8lU7cC
         Dcrzu551nBPqYUnhgR6nRlsTSnMid523QoDgIlsnC+jhjl4/tf7qIjU4QCN0zxjhOCGb
         CVmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790930152; x=1791534952;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ixm9wnTRw/IMUlrBZgFwX0kWno7rJE4TeERGvWa7BZE=;
        b=TeY0qbIovcQRGSIDO1U2zRn/CWzQgpk2vkwwSybK0QHDa3lTA5B2z3/F5aouiY6RC5
         +y46qzU10rW5Ys75AbGv35aWdrQRu93++PvR0NcnsJHPb2c1mcZSUxgOZmn3P4cx3CXa
         iqc3M8n/9p7Bt57r18QRY2qCU+1dQCogtjy4n/0E88TSF0Vzsqxjv9q813j/TJ+nSGLv
         v9Sd1g9upEXVoA3mKKQgrVACFmkp4r9Mu4VudATdnP69LTmd/X84bCxxJIFtnByC3xjx
         AsB1aESsHFHVD1tDM/a0dehgbCzcwqW/3Sz0epQoa0ckwT1Bum273IGHnAzinyVcdJa+
         y8rQ==
X-Forwarded-Encrypted: i=1; AKwUvBx3TTpCoHRRRGAzSpmdhLHSwbPEyvKsJVHRKpTrrmyaROV4qz+9lZBcltkOG4cMgkCrUgM/FPMCoLjcszoD@lists.linux.dev
X-Gm-Message-State: AFuF++lEJ6Lr4Ogba+fgAWN13E9e4awtQjBOs3HtrsM8SuvpqnHcoAa7
	NAdE9cRlkynBTMBLEyUhbnaIU25IjcXozfP/ZvtJImJM5CYPQWlSOg6Oc9Q0Bin4JOKApo/4oCg
	/EqywnfNCS3YqV4Dv9wnd7PtsqNrGt4Q=
X-Gm-Gg: AYBFou2dHnjHpxotQIIcqCx9mgZFhRq0pQuAhZTgfr7sdOALCXev8EPieS/tPFwzP6b
	otoxQ6zyLtj/c58QAjV9lSqAVNK8HcJ5ewZ3MRci0+rGJ6i+6/8FmFo02kj27crHCA/4djge4pj
	kl36vTCXtoBlGF8OwK/H6+iMkdy6Q89/rfV5Bt2IRMiyZgEycYRGz+8MuCdVEtce/OL7gwkqTJK
	rjA4Q9GIpXKNL0bbzJ4JCkA09hGlihbx78IzxeimemIrjkYAXpN57eoQeREoh1qjltYBcPk5k27
	hQp7Vf5/k9wmO3wFHJSsRv4oWMVa7SEAx3FdbJCyJeYKlSBjOAB06rx1Bc+TDQ8LfUlCVVA9I89
	qtmd84bTCM/mzbDSU/CHf8U0wXuA81cxx0w==
X-Received: by 2002:a05:6820:310a:b0:6dd:6d12:22f7 with SMTP id
 006d021491bc7-6df2f405237mr1797235eaf.11.1790930152541; Fri, 02 Oct 2026
 01:35:52 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:35:52 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:35:43 -0700
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Fri, 2 Oct 2026 01:35:33 -0700
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
In-Reply-To: <CAO7O_xjhrLNFu6sKEFWp8z+UCkcHu9kr9KfxtEQ=T9yKHCQT-w@mail.gmail.com>
References: <CAO7O_xjhrLNFu6sKEFWp8z+UCkcHu9kr9KfxtEQ=T9yKHCQT-w@mail.gmail.com>
Date: Fri, 2 Oct 2026 01:35:52 -0700
X-Gm-Features: AclHuK_Rcda0jD4_EFdo0LBQrOhCju3jgDj291uhH9JjAg7Gq4FtplduwTl4fRU
Message-ID: <CAO7O_xjv==E+tOwY90AKpKkbLbbUBtaNmiW2MzERewb+8XtDkw@mail.gmail.com>
Subject: [PATCH v9 01/15] media: ov8858: Extract digital gain programming
To: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@amd.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nicholas Roth <nicholas@rothemail.net>, 
	Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Move the existing packed digital-gain register programming into a
helper so clock-specific gain handling can be added separately.

This is a pure refactoring: preserve both the register packing and the
explanatory comment without changing the bytes written to the sensor.

Assisted-by: LLM sparse
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 drivers/media/i2c/ov8858.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index 0bfc4350a8c9..2a0e2b08b9aa 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -1524,6 +1524,23 @@ static int ov8858_enable_test_pattern(struct
ov8858 *ov8858, u32 pattern)
 	return ov8858_write(ov8858, OV8858_REG_TEST_PATTERN, val, NULL);
 }

+static int ov8858_set_long_digital_gain(struct ov8858 *ov8858, u32 gain)
+{
+	u16 long_gain;
+
+	/*
+	 * Digital gain is assembled as:
+	 * 0x350a[7:0] = dgain[13:6]
+	 * 0x350b[5:0] = dgain[5:0]
+	 * Reassemble the control value to write it in one go.
+	 */
+	long_gain = (gain & OV8858_LONG_DIGIGAIN_L_MASK) |
+		    ((gain & OV8858_LONG_DIGIGAIN_H_MASK) <<
+		     OV8858_LONG_DIGIGAIN_H_SHIFT);
+
+	return ov8858_write(ov8858, OV8858_REG_LONG_DIGIGAIN, long_gain, NULL);
+}
+
 static int ov8858_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct ov8858 *ov8858 = container_of(ctrl->handler,
@@ -1532,7 +1549,6 @@ static int ov8858_set_ctrl(struct v4l2_ctrl *ctrl)
 	struct i2c_client *client = v4l2_get_subdevdata(&ov8858->subdev);
 	struct v4l2_mbus_framefmt *format;
 	struct v4l2_subdev_state *state;
-	u16 digi_gain;
 	s64 max_exp;
 	int ret;

@@ -1571,17 +1587,7 @@ static int ov8858_set_ctrl(struct v4l2_ctrl *ctrl)
 				   ctrl->val, NULL);
 		break;
 	case V4L2_CID_DIGITAL_GAIN:
-		/*
-		 * Digital gain is assembled as:
-		 * 0x350a[7:0] = dgain[13:6]
-		 * 0x350b[5:0] = dgain[5:0]
-		 * Reassemble the control value to write it in one go.
-		 */
-		digi_gain = (ctrl->val & OV8858_LONG_DIGIGAIN_L_MASK)
-			  | ((ctrl->val & OV8858_LONG_DIGIGAIN_H_MASK) <<
-			      OV8858_LONG_DIGIGAIN_H_SHIFT);
-		ret = ov8858_write(ov8858, OV8858_REG_LONG_DIGIGAIN,
-				   digi_gain, NULL);
+		ret = ov8858_set_long_digital_gain(ov8858, ctrl->val);
 		break;
 	case V4L2_CID_VBLANK:
 		ret = ov8858_write(ov8858, OV8858_REG_VTS,
-- 
2.53.0
