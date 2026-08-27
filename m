Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBEE4BC006
	for <linux-staging@lists.linux.dev>; Thu, 27 Aug 2026 18:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854685; cv=none; b=V1RyG8ceYOmSBjX7V8YJmG0k2so0wmS40LfsAUG/MiZKkEY7LmXoyu0JbX3lTpkNUqVpKI8uiQGOw1RW17KRhz51Q66+n+I7SZ/hJ+yh0xv2Xl1vDu9SLukgZ5z0ovqY+364BqspMA57UoD/OnUTKQTrFwRBrpSpbMcPWsRV+6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854685; c=relaxed/simple;
	bh=6EF7z2uySlV4sLNAOPuHFw8GGYhKTCfnk5/Qxtc2JUk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FjQgOLlmjx+6dBsszJu5TDngNBIfZFpOd2gf4vBBS85yfqdMk7nnXBojE87jWR8tkoQ5nGNP8KOkVdwyi6XiqDgj6WzsqVf6Er+HJHHMeT8GWNmVVb5Sfjlm/Q3uEGy1+VVtPMFQ5UEnJT0+1SdiReVXgV1NjQPXVUffZUrtsI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dBKawdnV; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dBKawdnV"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso273735e9.2
        for <linux-staging@lists.linux.dev>; Thu, 27 Aug 2026 11:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787854682; x=1788459482; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4F+3K7V22Kkap0KpdpvpqiCWWLmTdrD5YToY0teInYs=;
        b=dBKawdnVoj7U1pPxhms1V4QLHO/AOzsgAc6zYHm4hiq2R3upkDo1pD/lS6JDQQAlOd
         c+uK/RyTJ6NWCBCsuSAJk2IDaQWHYtjbAexokRbk7RiOqX5AKRU1lNBQbadWN/iSXzcX
         hNrT+tmSdoxuSUV4xEcerC65Ug969oWRPGQJGEO6kjR/TxYV9np6/sswcRqRPJGfkWEg
         stYSZ+bxU/SC0LIcknMF5vwOzN0e/amtoIqMchwv9XZDP94gjfc1x35hb2t7hrhHUwYx
         fmehU2sQIDAEt4y4mtPHyOLbAIEy+DhZoyffOT00Zh9EO8dXI+tp4pd31mdLbOiIqOgK
         8Zjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787854682; x=1788459482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4F+3K7V22Kkap0KpdpvpqiCWWLmTdrD5YToY0teInYs=;
        b=Ki75p2Cmb82MpPK3qDgVcdrCotw3cUNxE3kC7qt8G0HjMkw4w3gryzPET6MLiOto37
         G9Tx6tlPOuDDcqVJy6lefGJhy3EXDxA9BkXRxa1K/5JMvEIT4aFmEI+ccG52T+UqpaT9
         msfYqYxDcNOadh0NDy2rf/8+ZbunBmbJHTICp02ovjNpPdZ1T5ZQsSZaN4y3yV4U75kW
         YV8OGQ6UmoWdzKAOHRihelEA+n36smDAoOJ7PUW3v64IadCS7fJK0NvR4m6+1hkGb3/h
         y/feMuVUHItLeJd7nhgyVhjnpk7bp0IHTlgxAH57d6WL2Emq1WS/8ByvvJfuY1ohVQhZ
         Olvw==
X-Forwarded-Encrypted: i=1; AHgh+Rrmhy2hylJ2pelN+85dIAxD/7YUaMA6DN+ZG3mTfHL5gatRnBxnUfdeSAJuBg4EidH7wvDL71vvjngmnwHs@lists.linux.dev
X-Gm-Message-State: AFuF++mgeVw6OU/1C6QXS56cMWDNXNvccjUwVul2vb1EPWdvHIT50v0/
	hmHfxEmL35D+JMtXgY/3QBeYFIFzL8cIw8OTCkeeCpBd+i8rux2pPZdc
X-Gm-Gg: AR+sD10lpVGCC+S7W8c8q/Bh4rVaH7o/q9RbztxuF2DGUlsIepw/QerwK23JGxu8LCn
	KR/v3r7avOsKxTatyrzuLymLkmYcZ2b4z48fjvtwbyskUL3dar9/sW8AdaQj9b+b5dpuXZRAZbk
	uSaXTaeGY4lOVxR6JXDRB9yEaFfMxQMR3gfSzr4yUV5nP2/o2D9qNxEfNqipOXClXp92vuBhQx0
	Ftkx9Azhg7flJF7uQxLSF9GsEs9h+cE7NIn6Ag5vQp3lkiL8FUGfBvqvv04Z45/CbFUMM2Q8t+3
	yIdocDkPZhWJ5tEGtEJyO4AfjPdGrtUzMMA+uiACykLfNpVgPuknxVSPQJrnWiZqQxeBJ6UJWl/
	uuytarULiFI80mKn9wHj0uCOVfdafAeVIdG33y7opMXAnZ6YosMVgrhzkatsZcNp37RdU5j+XJr
	RHTnhZPoi9LY0iCaH95UpD8sgqleS4wsOem6JNQAI1rwtW6YG/KKfJkjhmSNZv70YuFNfhyRaRs
	r4EPIAJTXxe1syAQOrHC5nL1nPeflV/v7N11rzNGucw
X-Received: by 2002:a05:600c:6091:b0:499:484a:98e7 with SMTP id 5b1f17b1804b1-49b91c4b3c5mr14656215e9.14.1787854682035;
        Thu, 27 Aug 2026 11:18:02 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm66270655e9.4.2026.08.27.11.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:18:01 -0700 (PDT)
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
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v2 01/11] media: ov8858: Extract digital gain programming
Date: Thu, 27 Aug 2026 20:17:46 +0200
Message-ID: <20260827181756.2430054-2-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827181756.2430054-1-mauriziocasciano7@gmail.com>
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
 <20260827181756.2430054-1-mauriziocasciano7@gmail.com>
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
index 3f45f7fab833..f0b3b4a5d3bd 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -1523,6 +1523,23 @@ static int ov8858_enable_test_pattern(struct ov8858 *ov8858, u32 pattern)
 	return ov8858_write(ov8858, OV8858_REG_TEST_PATTERN, val, NULL);
 }
 
+static int ov8858_set_digital_gain(struct ov8858 *ov8858, u32 gain)
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
+		ret = ov8858_set_digital_gain(ov8858, ctrl->val);
 		break;
 	case V4L2_CID_VBLANK:
 		ret = ov8858_write(ov8858, OV8858_REG_VTS,
-- 
2.53.0

