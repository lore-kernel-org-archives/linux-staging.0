Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D44730FC24
	for <linux-staging@lists.linux.dev>; Sun,  1 Mar 2026 15:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772380404; cv=none; b=Gnzjodcq8Hxz/wZNrlTqdeDBIBYoroSnb5GjecZrJiLAqzD4niA+Yd1z33P/NhPM0bkjfEZoBx/YELQ/czjsxhX2KwOQbzjAA/oZr2tevZ/RKQ+HJWFeAaPH9c6hKwwrtBektg9LMtzJP0YdJs09v+5whQuaKWacECepp1loVo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772380404; c=relaxed/simple;
	bh=4CLluQJZJe2UFWmhu6vqbrtGj3pK+/lNOzpqz1CRzh8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MZ1/aPoAGaHvCAEmdwmBX9D87Ob+RpUm4wPxeXDCQCaCBGNuRmRpqT2i2RY9nuUkwisLPpabqBaNFmYgud3Kljm0d8ycieyVw1X7JOBllHcGiL2BXbL0w+vdGMV2GF/ekIXzfWnAnHAnhBHn3fn0I3mk2vJaI8qKA9Lbxkw3Ppo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UUBe1fJf; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UUBe1fJf"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-899d6b7b073so28014686d6.2
        for <linux-staging@lists.linux.dev>; Sun, 01 Mar 2026 07:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772380402; x=1772985202; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8piR2oQzjWhhPzsrfJoM5iuWyu9p3jO48h603VTIcNs=;
        b=UUBe1fJfxtIJHe8/BANmnaCUim3iRgW8H+svMBt7sYHJZhJD9hZ8ZxFC9AmtWP1dvB
         ZzzVfx/rkGHh/ev6rSXZCilrCUxiBShEnmvmxL/48sXds+cTv4E4ibyBnqjfo5xJ621w
         Ey/93ENHyeFhiR3IncTVaFCrkjIYcgIlCHz+haVqQOIUQcaCqqJFLRj0oH8p1SxICX7U
         0wwWvj4SuUFVnijmWMSgxwElTaPbUqhhA605BNkJ0C7rPWjeqYXYN88gi1tmyyrDpbMC
         GP5/2o7RqTAFtUGMOQBp6Esc55zgM14g9XUIUtkHhmmg6jYdYnqTMNtB3cor3pxDEzU8
         x+dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772380402; x=1772985202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8piR2oQzjWhhPzsrfJoM5iuWyu9p3jO48h603VTIcNs=;
        b=ZwCu8bXZczmWN8K8Eytnnc6Bmo4JtgVnK+t46rg2HheDOK1a8RyrT+OMSLM+xyGGB/
         vZhkRAbk5IO8W6CvMz6LTihyhOirIubr8SnjLDYshwLhdAY+2KlHUP9eUi2xbSIwuxrI
         xd2xySpfKux8eb4jAQLFN2DiReUFugQdEGm8fMeCwStoFk85aLTzGfnr49wCuqq0ogZX
         /M8solCKW9tSP7ItbBhO5HqiVf/V0qofnt3OCZlGP1cX9carjUx5ME0O+7H/ee1phAf4
         AwUfiD5+/EWCM4yA3awzH2Kbr8jbXYvZPRBOj4IFMB45axE1Dh1tOFPdhi8w+Ago4bzO
         kdQg==
X-Forwarded-Encrypted: i=1; AJvYcCUAcrC7eqCZrh9edrn9tmacMBgCvH92nMcv24Cj0ozEw3hme+VuDx0KnKzEc94QQ7OoOgwOQ1ZggdY25+bM@lists.linux.dev
X-Gm-Message-State: AOJu0YwAT5i1pAY2MLFDj6QUyBCg+NsvpfkQzh8/iy/qeoJ9QEq1mvC7
	gaPysFtXmELDo3RmEVyykgqPX5ojvBxSQ5lcj8qIyI678ae/0tx9hW3SUh7qv/4/t1A=
X-Gm-Gg: ATEYQzzh7wWWF121JvOaSShj6BtI2ePs/AP5S1l45UtjPtsaQYs0dYzPiHCaNlwcNWT
	OMAcW/rTRQyO4Uobimgf3+onyHe+QoK0y1eykfLYLMhaUf//XyO0m98BYOX0YrfF49z1Nv8wMi0
	3pDAClrMrwX81rxu1/U8eUrInbUmw0OtuXDQsuTj2upre2vIuQUPwTRVnUHY+jun447PN+7bSkm
	/+CnjvHx6yGy/2v9qbnIZAOFAAgDkGCl18B5GooZFsLeY8RUp94j2O3FUYOovt26V4SE22gfVnp
	QxlovShofB/YUUVonLFAFYp3MncNUIvbLKKN+3YZbZ9GqfSdbyzfprlJM8Ym731CIrVQxBE41qK
	DaJ5pwDr/HzVuMWI37vm0rUbr0I0u3/CNqW9bbDaHgEY4+r1e3DLIkyk+OKrWhW0Ha7UqjvJmAR
	Jf76rwBcGNDfsxDmDCfyB3aFyEt6TuF5nd2EKRplFH9fgQQWy9Ury/QvSuRCgZ30yj1wSffEIVl
	+cW
X-Received: by 2002:a05:6214:2481:b0:899:b42f:9dea with SMTP id 6a1803df08f44-899d1db1605mr137903056d6.25.1772380402355;
        Sun, 01 Mar 2026 07:53:22 -0800 (PST)
Received: from instance-20260207-1316.vcn12250046.oraclevcn.com ([150.136.248.187])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899efc810e6sm21128516d6.5.2026.03.01.07.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 07:53:21 -0800 (PST)
From: Josh Law <hlcj1234567@gmail.com>
X-Google-Original-From: Josh Law <objecting@objecting.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ovidiu Panait <ovidiu.panait.oss@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: [PATCH 4/4] staging: axis-fifo: simplify error returns in axis_fifo_parse_dt()
Date: Sun,  1 Mar 2026 15:53:18 +0000
Message-ID: <20260301155318.2596519-4-objecting@objecting.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260301155318.2596519-1-objecting@objecting.org>
References: <20260301155318.2596519-1-objecting@objecting.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace redundant 'ret = -EIO; return ret;' patterns with direct
'return -EIO;' statements, and change the final 'return ret;' to
'return 0;' since success is the only path that reaches it.

Signed-off-by: Josh Law <objecting@objecting.org>
---
 drivers/staging/axis-fifo/axis-fifo.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 7ca0404b0875..9aeb16d8a71f 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -403,8 +403,7 @@ static int axis_fifo_parse_dt(struct axis_fifo *fifo)
 		return ret;
 	} else if (value != 32) {
 		dev_err(fifo->dt_device, "xlnx,axi-str-rxd-tdata-width only supports 32 bits\n");
-		ret = -EIO;
-		return ret;
+		return -EIO;
 	}
 
 	ret = of_property_read_u32(node, "xlnx,axi-str-txd-tdata-width",
@@ -414,43 +413,38 @@ static int axis_fifo_parse_dt(struct axis_fifo *fifo)
 		return ret;
 	} else if (value != 32) {
 		dev_err(fifo->dt_device, "xlnx,axi-str-txd-tdata-width only supports 32 bits\n");
-		ret = -EIO;
-		return ret;
+		return -EIO;
 	}
 
 	ret = of_property_read_u32(node, "xlnx,rx-fifo-depth",
 				   &fifo->rx_fifo_depth);
 	if (ret) {
 		dev_err(fifo->dt_device, "missing xlnx,rx-fifo-depth property\n");
-		ret = -EIO;
-		return ret;
+		return -EIO;
 	}
 
 	ret = of_property_read_u32(node, "xlnx,tx-fifo-depth",
 				   &fifo->tx_fifo_depth);
 	if (ret) {
 		dev_err(fifo->dt_device, "missing xlnx,tx-fifo-depth property\n");
-		ret = -EIO;
-		return ret;
+		return -EIO;
 	}
 
 	ret = of_property_read_u32(node, "xlnx,use-rx-data",
 				   &fifo->has_rx_fifo);
 	if (ret) {
 		dev_err(fifo->dt_device, "missing xlnx,use-rx-data property\n");
-		ret = -EIO;
-		return ret;
+		return -EIO;
 	}
 
 	ret = of_property_read_u32(node, "xlnx,use-tx-data",
 				   &fifo->has_tx_fifo);
 	if (ret) {
 		dev_err(fifo->dt_device, "missing xlnx,use-tx-data property\n");
-		ret = -EIO;
-		return ret;
+		return -EIO;
 	}
 
-	return ret;
+	return 0;
 }
 
 static int axis_fifo_probe(struct platform_device *pdev)
-- 
2.43.0

