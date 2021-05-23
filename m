Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17AD670
	for <linux-staging@lists.linux.dev>; Sun, 23 May 2021 17:12:42 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id i67so24885296qkc.4
        for <linux-staging@lists.linux.dev>; Sun, 23 May 2021 10:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NI6VGTgdO7QUPT8Xbl98mX1OA2u/yEB+lofSkIV6DFs=;
        b=Cv08fynHoQ3MdJJet/pK3X9cTxSniHt3KnvtbV43MHXpC8EgI7CB3ZmkQvDpeU+ldV
         AXOpIRVo9PUUPrhvkMkeyxlsh5BOWuSlIqbDhXA2XDHSkRn1UZLjpZWNow/c0qPzbeYu
         y5+5rLV9wslYZjJqRw87WlIG5v3AIYUXZuJbtgzmRUaw4rN3t6l44+o1eEVrhtCIS53w
         KxLyliwMZP1fltrBWLtvagEwSpnEx0Qa+uuBw9AG8VvSlskxvRLE2ZKrwYhuicVDloOU
         C/GFSfMFEfp/iNrpP5r7d29LimWwzj5Lp9aITO7UNutfDtwHS4attXoTHhcmMnM/BWVX
         i7jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NI6VGTgdO7QUPT8Xbl98mX1OA2u/yEB+lofSkIV6DFs=;
        b=qngv8TCO+KDsxJ6AyrFH7AHEQI5M42zAoMCh3/4qUBW/W3jyxbud9sl7xdU2Y+NoOd
         TOhRPmAPeYLgqxBvz2wvGbSrZMUfcP0WNipR4qsNcAhqIxrtha9SejgZTdrlSRI/TVOD
         WZCLVCHmB7t8NF7maMAP2vyrcWM5OWoCRZGY5cgVZBd1KY4ddB8m0eDlia3HIsauLfM1
         wN9/RJ/0dfNOWvy6NFGeBMgk3iipEw/Jjj2u5vwX8NE2dl1HiL6pzGrvzpGnAkPYjPDc
         rQesnWXPyumdyFglCacxwvd9vvgOeQkW/UkYNzYZdM9/pXvIrt2o0Qas/UMMLsIJRppL
         Fa5Q==
X-Gm-Message-State: AOAM530mGFtZ+flNGDgLiRGt3mLKq5RKUymcdYFgeUqU9pQYDHV7GmDx
	4c5HVr1pxOvoFRIG1nQBV9A=
X-Google-Smtp-Source: ABdhPJzMy+yWRIRNkHTk1RCYZRyY0+b9LlR7tq95R7QTH1YZgdH9euujbyRqArU714Yh2EL+jvrcKg==
X-Received: by 2002:a37:aa4c:: with SMTP id t73mr26395487qke.79.1621789961284;
        Sun, 23 May 2021 10:12:41 -0700 (PDT)
Received: from smtp.gmail.com ([2804:14c:73:9a01::1003])
        by smtp.gmail.com with ESMTPSA id n18sm9115529qkh.13.2021.05.23.10.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 May 2021 10:12:40 -0700 (PDT)
Date: Sun, 23 May 2021 14:12:37 -0300
From: Lucas Stankus <lucas.p.stankus@gmail.com>
To: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] staging: iio: cdc: ad7746: extract capac setup to own
 function
Message-ID: <b637a5ecde4e5f9f927a5b104332378d4721c91d.1621786036.git.lucas.p.stankus@gmail.com>
References: <cover.1621786036.git.lucas.p.stankus@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1621786036.git.lucas.p.stankus@gmail.com>

Refactor the capac register write logic to own function.

Also fixes the following checkpatch warning:
CHECK: Alignment should match open parenthesis

Signed-off-by: Lucas Stankus <lucas.p.stankus@gmail.com>
---
 drivers/staging/iio/cdc/ad7746.c | 36 ++++++++++++++++----------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/iio/cdc/ad7746.c b/drivers/staging/iio/cdc/ad7746.c
index 367a5990ae35..4221312f0a32 100644
--- a/drivers/staging/iio/cdc/ad7746.c
+++ b/drivers/staging/iio/cdc/ad7746.c
@@ -209,6 +209,19 @@ static const unsigned char ad7746_cap_filter_rate_table[][2] = {
 	{16, 62 + 1}, {13, 77 + 1}, {11, 92 + 1}, {9, 110 + 1},
 };
 
+static int ad7746_set_capdac(struct ad7746_chip_info *chip, int channel)
+{
+	int ret = i2c_smbus_write_byte_data(chip->client,
+					    AD7746_REG_CAPDACA,
+					    chip->capdac[channel][0]);
+	if (ret < 0)
+		return ret;
+
+	return i2c_smbus_write_byte_data(chip->client,
+					  AD7746_REG_CAPDACB,
+					  chip->capdac[channel][1]);
+}
+
 static int ad7746_select_channel(struct iio_dev *indio_dev,
 				 struct iio_chan_spec const *chan)
 {
@@ -224,17 +237,11 @@ static int ad7746_select_channel(struct iio_dev *indio_dev,
 			AD7746_CONF_CAPFS_SHIFT;
 		delay = ad7746_cap_filter_rate_table[idx][1];
 
+		ret = ad7746_set_capdac(chip, chan->channel);
+		if (ret < 0)
+			return ret;
+
 		if (chip->capdac_set != chan->channel) {
-			ret = i2c_smbus_write_byte_data(chip->client,
-				AD7746_REG_CAPDACA,
-				chip->capdac[chan->channel][0]);
-			if (ret < 0)
-				return ret;
-			ret = i2c_smbus_write_byte_data(chip->client,
-				AD7746_REG_CAPDACB,
-				chip->capdac[chan->channel][1]);
-			if (ret < 0)
-				return ret;
 
 			chip->capdac_set = chan->channel;
 		}
@@ -478,14 +485,7 @@ static int ad7746_write_raw(struct iio_dev *indio_dev,
 		chip->capdac[chan->channel][chan->differential] = val > 0 ?
 			AD7746_CAPDAC_DACP(val) | AD7746_CAPDAC_DACEN : 0;
 
-		ret = i2c_smbus_write_byte_data(chip->client,
-						AD7746_REG_CAPDACA,
-						chip->capdac[chan->channel][0]);
-		if (ret < 0)
-			goto out;
-		ret = i2c_smbus_write_byte_data(chip->client,
-						AD7746_REG_CAPDACB,
-						chip->capdac[chan->channel][1]);
+		ret = ad7746_set_capdac(chip, chan->channel);
 		if (ret < 0)
 			goto out;
 
-- 
2.31.1

