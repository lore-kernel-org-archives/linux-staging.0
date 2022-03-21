Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CAA2C9C
	for <linux-staging@lists.linux.dev>; Mon, 21 Mar 2022 12:37:05 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id j15so15437462eje.9
        for <linux-staging@lists.linux.dev>; Mon, 21 Mar 2022 05:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7me8S3DIeK4bexe2TBxZLK2PJKyh4lTG51mZlWXkZww=;
        b=C19FsPW3byM6bnKzUkgtA47+KFtmLiWrmr4t6hSJGULj2k309rEBEtN2OGQsQRiwuq
         Tf7pGGbRpBWabv9ws0LjfO1OL+rhABFTf+vjU+HIUUnAQRbmDhdFLmJpMp+yjZ8xSV4B
         KUfeNsDBZsJHX3FP8Lk7r2hiXgERWOOIBOGZ3FcOfhKTIgdhYHT3bknlW4P2YOYCrDXv
         5rkAOgvhMbmPGyyfARZBgE1MHiem0Ujlefjvar28MLDqRVXhaMP1F5tXGn792CIrUp8i
         qMmwJn+4Tj+g36DpgP5vT9kKWi3ykd/ErottJfQwACHtJmP9342GGljWeMeJpbxpoRYQ
         9WVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7me8S3DIeK4bexe2TBxZLK2PJKyh4lTG51mZlWXkZww=;
        b=FIaSeMmeDo3e7MMJ8hHDdyMtwLWyShiCl572qcpe7aSJ+AQCoKHBU9hl3H8ch5g6SP
         x1LRVM/EwYl5mS5kS2tBhbBosGAb5oPo3xT5ny1iPFXzOdFeOHHN5JUnuKXo0Uqvh63/
         CfxaF8O8z7FiTqmYyRE3EcZaiZBcfJqip3rsAYlKbUbac4V/WDmSaCfbH9dcjXupQJnZ
         9Nl0ChLfBFtNMqMZQDw5/QtlT3ctS5ea0Qcf9WWvVRnZM9XS/Rd6ql5AfoJtiwc7+z6N
         kLU0iK2Ajz3ivI17l87bW7dpZQSc83CbUdXSUobpHM5FjMX7Y+T4Rg/pPAsFZGJeoWQm
         TgjA==
X-Gm-Message-State: AOAM5315pgK+r6mAzFkBTHhvd8Ut2dw5IJUil47naVhsI+qTT62MSLOh
	ciBYycYPnTGYIlCzqvFiVVc=
X-Google-Smtp-Source: ABdhPJz//+/NzM8a26O+rIuAgQzPd3NBsmf9i2GYdkXJe3FDISS5jPq35iB6eXU0g5Afq1Abig9xGQ==
X-Received: by 2002:a17:906:dc90:b0:6df:f5fb:cf91 with SMTP id cs16-20020a170906dc9000b006dff5fbcf91mr7190371ejc.429.1647866223710;
        Mon, 21 Mar 2022 05:37:03 -0700 (PDT)
Received: from localhost.localdomain (i130160.upc-i.chello.nl. [62.195.130.160])
        by smtp.googlemail.com with ESMTPSA id q16-20020a170906145000b006bdaf981589sm6836241ejc.81.2022.03.21.05.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 05:37:03 -0700 (PDT)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>
Cc: Jakob Koschel <jakobkoschel@gmail.com>,
	linux-kernel@vger.kernel.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	"Brian Johannesmeyer" <bjohannesmeyer@gmail.com>,
	Cristiano Giuffrida <c.giuffrida@vu.nl>,
	"Bos, H.J." <h.j.bos@vu.nl>
Subject: [PATCH] staging: greybus: codecs: fix type confusion of list iterator variable
Date: Mon, 21 Mar 2022 13:36:26 +0100
Message-Id: <20220321123626.3068639-1-jakobkoschel@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the list does not exit early then data == NULL and 'module' does not
point to a valid list element.
Using 'module' in such a case is not valid and was therefore removed.

Fixes: 6dd67645f22c ("greybus: audio: Use single codec driver registration")
Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
---
 drivers/staging/greybus/audio_codec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
index b589cf6b1d03..e19b91e7a72e 100644
--- a/drivers/staging/greybus/audio_codec.c
+++ b/drivers/staging/greybus/audio_codec.c
@@ -599,8 +599,8 @@ static int gbcodec_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 			break;
 	}
 	if (!data) {
-		dev_err(dai->dev, "%s:%s DATA connection missing\n",
-			dai->name, module->name);
+		dev_err(dai->dev, "%s DATA connection missing\n",
+			dai->name);
 		mutex_unlock(&codec->lock);
 		return -ENODEV;
 	}

base-commit: f443e374ae131c168a065ea1748feac6b2e76613
-- 
2.25.1

