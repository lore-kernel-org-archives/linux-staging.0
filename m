Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C35264A7F
	for <linux-staging@lists.linux.dev>; Sun, 15 Jun 2025 23:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750029108; cv=none; b=WqeEF+a5fpci8moPeTF7HFkMPpSA0wVWYESEKgxu2bRM7NOE/CwCXV/J7gCKzw0LzO6Ne7EZiUP63kPRBc5+reb3tLWQ5Y4yiPghW/Bg29giocX0hF/lGugYChrhbUw0qG5QPvNHf6AK9NJE6b5iQDBGeWKuFUypvb2A517gfsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750029108; c=relaxed/simple;
	bh=B0iVseJ6KZ3tp3xudimOormlRAJxc/UuS4tDDKg0X/4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SkYx9WNSergzoVGs+riAX8zZVrX05DlVgBERVBjVijwh+8AAqiGyqesQVgaHWAw0l9jve8tYiV+6D15DVCQguWlgQNCa3PdDgb7E0g9Om+NZOfhMNVS6oWR2R+hRNcis/lHxrD1NFHNQUCg0hIy6hAoZei9vyASBP9QqI7TmvLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U5pT1jhv; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U5pT1jhv"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-addcea380eeso622032866b.0
        for <linux-staging@lists.linux.dev>; Sun, 15 Jun 2025 16:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750029105; x=1750633905; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o3MfXo6iTt/rSpgf0lOwf22UCNwL2LWT3y/KcFVDzVA=;
        b=U5pT1jhvSGXcb2aYdYBpg4CtWJ602dJcMNshEy1GNah2IuSoC//IfyFqH05aHiydny
         SK0qV3nMziPE2s8K7sRsLp8K/llRbWN3CZm95q8Zhl97OpXUNugMrXSENkcRpltrtpaq
         MyOjXYEq8mFJ38vVN7sKgiqkXB+enLGZKO6XkQjyHoq02FjF4x7MYGLzEi+lAjNp51FU
         C7iPnfiqhqxQdufv3H1dcJ63zmzn26uDjKlPVRLaIwMSIwDBJZap64bXHY5en+walpTP
         3l+4Jhwl3Wmn++viHUy48wfwBbq3zwTEjaKOkmeYrxXCELapDTTwYzu1PI6GGxCPw+BG
         eQcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750029105; x=1750633905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o3MfXo6iTt/rSpgf0lOwf22UCNwL2LWT3y/KcFVDzVA=;
        b=BwZ0Ad6gM0pMsbxGyprLRzujBeJVE/9io+6vjAi9vPp7jAcOs1MwH6k1bgwRPIBCEh
         NO0XS4coEAYakoqvR39dPdpgg5wIKUdoB1ZLCpICTYJoYumPA0eo9pMTV+U0hZvaiM/H
         0wiy7qDszTCkr7QuROgiPGR0jrm5CF1thVNNewdzb83rqoPYSJG1Xoi/73yQj97V7q/r
         5TywndXTJtAegbiZE2Hs0/j9TgcfrqtNNrxPtQLCP7n9Dt89CntGZAZ2FcPwMNdsrjoI
         I45Rk+e7cJVJFRjAM4PK4eWnUl+Io28ovX/f6s/R+zUcyl2ZhnXq340vEGYDlAQFQCWc
         M/6w==
X-Forwarded-Encrypted: i=1; AJvYcCUMsPGp+z+y7vKy0FfOxgHEb0nCZeG914KuzWf6EO3GAkB/6QYwm2MjTSG75fqjQS3ALB0K9T/yQ9zn5nd9@lists.linux.dev
X-Gm-Message-State: AOJu0YzPU6zXZuaMdgINa5gMq4SijZ3OIu2f+Iya4FyfZEcCMQWw2lic
	bcLLclOMC9OKr++fQyh7S08nfoRKmJDBP2DfAHEGA+m37ZchVc+F4MCQ
X-Gm-Gg: ASbGncuX+mmfnP1A8jZDsfypvVLyubPkg3mSDfckHdPxgY+Z/Y0kYY+E/tHnIWdXhWm
	kXoIQEQtY8sw3a/cyB/c3oSxw8EGhdgczldiCkZq2xUposTgKU6v3dNX1zjIOGFS79miKnywQ59
	H1myFQsOPNt25lpVUVZlAbXx23uM0e26sUva16yiqhEyE26tEezdQsTEWN33L3VLa/tObbUc5sh
	U6vdNvQ5nd1Sj0hKfNWFzeFSKkSZV9wjNaXgPrNBdwZ50lDCA3lPpzxs/LUrcGLkbuD+KkCVe9p
	+DYg0VApy/8SGIgXP4i207/vTB70IHYPqECQ8ZDxCj+snre/2ZFD1dUMK9SbMepufQSRR4aT10j
	FGRD3EHeKVvGkLrgTBsi0D66d3ksk8X9WP+TLKEzEtB3AQd+5dtVexKl6KzL9C6WiRBG9ILqGic
	GklDC6m4uZK0oQFV8S5XIGlNg=
X-Google-Smtp-Source: AGHT+IFdrxWCL1P0Gvj/YWLyU2wCRVVWjPVxbubsgx7NVKtIKNZYJdLu2b5cXrsCRQnkNkJ+R/KaDw==
X-Received: by 2002:a17:907:94cb:b0:ad5:4440:23 with SMTP id a640c23a62f3a-adfad46a000mr686609466b.50.1750029104907;
        Sun, 15 Jun 2025 16:11:44 -0700 (PDT)
Received: from chimera.arnhem.chello.nl (2001-1c08-0704-3500-b0b7-97b6-556d-11c4.cable.dynamic.v6.ziggo.nl. [2001:1c08:704:3500:b0b7:97b6:556d:11c4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec81baf3esm546347666b.40.2025.06.15.16.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 16:11:44 -0700 (PDT)
From: Thomas Andreatta <thomasandreatta2000@gmail.com>
X-Google-Original-From: Thomas Andreatta <thomas.andreatta2000@gmail.com>
To: hansg@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 2/5] Staging: media: atomisp: i2c: hardcoded function name
Date: Mon, 16 Jun 2025 01:11:40 +0200
Message-Id: <20250615231143.1558392-2-thomas.andreatta2000@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250615231143.1558392-1-thomas.andreatta2000@gmail.com>
References: <20250615231143.1558392-1-thomas.andreatta2000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Checkpatch fix: use func instead of hardcoded function name

Signed-off-by: Thomas Andreatta <thomas.andreatta2000@gmail.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-gc2235.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
index 857d7175942c..f35d1a16f627 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
@@ -779,7 +779,7 @@ static void gc2235_remove(struct i2c_client *client)
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
 	struct gc2235_device *dev = to_gc2235_sensor(sd);
 
-	dev_dbg(&client->dev, "gc2235_remove...\n");
+	dev_dbg(&client->dev, "%s...\n", __func__);
 
 	dev->platform_data->csi_cfg(sd, 0);
 
-- 
2.34.1

