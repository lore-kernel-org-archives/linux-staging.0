Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D26226D18
	for <linux-staging@lists.linux.dev>; Fri, 28 Aug 2026 16:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787933706; cv=none; b=G2NWRqZSBXEtn+9rnIeBb5tNTUhdHsB0hFIQhH5apSYMx1hhLq0BS6+aQufJqkLzjCcabnHE/+cgouKrdLUicYOEs8t6ncHeY0cmFyq9VMoQgkmMZDSgzRg36aAFTsVyhYPVSwIZ2+/nwZ5L26mPfkv9OzydXGP7HG28TRF1+ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787933706; c=relaxed/simple;
	bh=xhrDm+Mv7c74PMtacFvusD+88J1ycuEMG7fJpBlsDjE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FQFek+r8AhA4lo3ptwVK6s042eORahw6+UUBt2xDR71wNQQGLhqjOsnchTbBrmJIUQ/Vz3aeUorD6ZYbVFmqvK2wfNF1Kewzs7Ttjvv5qq57fpdbztIDi72Lj4Vz4RdLQVFuEpQgMDdaJIQq8t1bqUCh4yEMWwm63UoeuVVPemI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UtYvH7RB; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UtYvH7RB"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso14177875e9.2
        for <linux-staging@lists.linux.dev>; Fri, 28 Aug 2026 09:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787933703; x=1788538503; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KZWFTR8cjCr40UFMGvLuRrF9M/oaIFX/lTih1P5E7Kk=;
        b=UtYvH7RBWBAjzXVv3eFmE3KlAFj5tne7fQPVu9sYXEgmmgGf22ZcZRsKDNeotqiLSu
         AhggBRfsXmKeey+TRFFzuu1GQKXkxH8fOwyBokA062d2NqdDPEAsUsiB17gwJHoU4sti
         TUSsg5jNoNIxomD58osH+LiMMoYi7zAVge/ry/kfAicN5jSVH3OWQswEnO2gm3fuy/R/
         F9zNmUPJc5AlYwWJbiZgStDwfGq2QbeK69Yz5ib17eudc+gU1ano70tNHavvoANTIn0t
         C6q/Ab5bIsazPwsL1fu7eXq/VH3KeHC8LbSmMtXr2bY5fY9DCs38HTiaGlYQsh0wMwwk
         u+IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787933703; x=1788538503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KZWFTR8cjCr40UFMGvLuRrF9M/oaIFX/lTih1P5E7Kk=;
        b=MhYtf5D+OXWCgL+8ujFAuSSkGW5lAQrigSwsBdMX/9BT8yfIIvQ/63LMmnumjzxT83
         Y85I36sHX7rJDx41ADL48Nt6vj9ON3J6PpJQ4SiTJ58sP+bf6JV2XEUI7kSvnaIOVzmQ
         UQqGdn0Z7xs/yDYa6iF2pXseOeCJ11d0RYVB/NdfGdjaWivB+egOJWWT0LuUqR27TKuU
         jmNcfvjeLSgLP7lUUZ7Kohuo2sYjLLIUh4t1UCYeA8DatRhxRV9bkDxwIQew5Hw6PNcY
         +L0ne/iZxl6u7AhXTwruRaP42Kp9Df6zb3vcMjb8DSwwIETLgKU075cn8jZIZRvdJp0Z
         naug==
X-Forwarded-Encrypted: i=1; AHgh+Rpp42rRWXpss1qbs+6Q6S4aCbPbEBn36lOZ22Ql3EnOdMj/6t+3jaU3bF5SnkshYouPkcwZ0jCSSxtBUM3r@lists.linux.dev
X-Gm-Message-State: AFuF++nDdycaynm1rMn3o+eO0wA4CAA4EK/uQeeIYOo2NDH36OJQAZRq
	ScT+n6JwAZ32tU5EUJTj5hks92CeIwntDnPH7VNB0YAEwU39YHD2cYrY
X-Gm-Gg: AR+sD10OuYTaCEvbGZx46uqdJ9KT45iIt1WvNHh4AdCVKvfxGD4ZcfddDAU1tg61y8q
	5FMHn6VOR3D/W+ThPgFD14YhmWIoomX5TeWTzgzQTD46LW0pqdXDfQi2WTFGgYTa2diD2ZX2lui
	h4XRBH/6A6bAYwCI6M5ieWtfVtkD39b1AH/8q73kRZMrr9f+LkxjvsZ5TCcmkvwvLJfUpMgajh8
	JxTqDTgXwUiSE879SOOl0E4rFnS523SzROjvknLk57e1JZ4xx2V5UkQk/1aUfdSmq7E14Q1+59A
	CaYGWeyos6jlT2izJwDynPLjpJTaeksspdQGGuhQ6v9BBgfCVsjkad3hG66GeZZNUBWYZiZMI9y
	7iTUqtPIQZ7I4rzEpCubl5tCMyEAVsSVVDlkA2kq7dVyx6Jf69u9RQk7qw9klDl8puLjaSUtCrd
	bq2COJhECTnmblLOmjj8MsXuXVjDU+jgF2rsMqjPVeqOJbbPTlAjBsGA75lTIIJhL3hm2istADH
	6ii3GV1JVV3hDY1h1idwIVIU6FDj95xNJhLY4c68Q==
X-Received: by 2002:a05:600c:354f:b0:493:c47f:3c55 with SMTP id 5b1f17b1804b1-49b91c1ece1mr134990155e9.5.1787933703419;
        Fri, 28 Aug 2026 09:15:03 -0700 (PDT)
Received: from 1Z10 ([78.213.5.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3f45sm7629739f8f.7.2026.08.28.09.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 09:15:03 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	Uwe Kleine-Koenig <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v4 01/15] media: ov8858: Extract digital gain programming
Date: Fri, 28 Aug 2026 18:14:43 +0200
Message-ID: <1a7c8fba6835b2191b71ae1d903734621626e1f6.1787933456.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1787933456.git.mauriziocasciano7@gmail.com>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the existing packed digital-gain register programming into a helper so
clock-specific gain handling can be added separately.

Assisted-by: Codex:gpt-5.6-sol sparse
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 drivers/media/i2c/ov8858.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index 3f45f7fab833..d95f034de752 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -1523,6 +1523,23 @@ static int ov8858_enable_test_pattern(struct ov8858 *ov8858, u32 pattern)
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
@@ -1531,7 +1548,6 @@ static int ov8858_set_ctrl(struct v4l2_ctrl *ctrl)
 	struct i2c_client *client = v4l2_get_subdevdata(&ov8858->subdev);
 	struct v4l2_mbus_framefmt *format;
 	struct v4l2_subdev_state *state;
-	u16 digi_gain;
 	s64 max_exp;
 	int ret;
 
@@ -1570,17 +1586,7 @@ static int ov8858_set_ctrl(struct v4l2_ctrl *ctrl)
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

