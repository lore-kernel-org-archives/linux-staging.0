Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D4971
	for <linux-staging@lists.linux.dev>; Tue, 11 May 2021 20:54:23 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id c10so5888067qtx.10
        for <linux-staging@lists.linux.dev>; Tue, 11 May 2021 13:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=AgQ2n9+6IeoVaWhLZCiArb6AeGJGZzOWQRj/aOD3WEo=;
        b=tI8lM54Ig4ZEpd1yVxTqNQjEdAZ/Ew5lU8A5S6uPMke+7+KqWhNhJ3aInBN78lfoVU
         rDweYDB2VrTUBJDyFrgenM+E0exe4vjN/5GahDOtsabouUTukm5LeEU+9zuUb1EJdl2Z
         7/onCUq0aoe6fAYQkHXhK9AOYhqg4f5kuKCK0DBc/LSruU5a110n2MeXwyS9Dr7MXCfa
         XrOiV25he75aevKQGLM3f9fEd/lK1j+45MFX5MWUUmxBzLxxROidIdWaBS3iay2/XEEa
         dmC4qqTs5dE0ot0p+9tSUOlXx379iFinl+b/PbQAHN85qWi5A2sWb6in8g7vQGHvkl2j
         +Cwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AgQ2n9+6IeoVaWhLZCiArb6AeGJGZzOWQRj/aOD3WEo=;
        b=GltbJqOduWpVnyeIzZLhvw7iMphU4IPADB9CiK6FP/ydDZLKPcihmqylU+yzyFW0Qk
         j5/Avj77aXDWCjm/Iu5Xcdyodex1zfCPE0G4xMJ2vDD/T1ZJzkfmZEu57txCMw4bONdL
         HtvlF9U6oT8UtkAMin60qx6zXo6WLk+SebpW4GWf49VUCPFJFQ/coSP+YGshYbjn/bHX
         haJp6v/sdhns6+ACfGZ21nVbe7fu2NB0xZQGkVnHvrSL4jvG3o5igsbvZQvcFlSvSoan
         XqJRalzo4gaskpsEnWdT5zuTb3XhUavErlRcSdqa8clMKtrMvnj7ciz4qLu9sFFeigjy
         liOw==
X-Gm-Message-State: AOAM533IjRjEg+6os3zB5rA9YL3NJpjGxCqS+tZUYz4vpmJ4QUuUM4MB
	Gqi+vOSIP2xf4nvQ31YKtbQ=
X-Google-Smtp-Source: ABdhPJzrlW5lo/tug8ic0QrjBCgy0r+P3AsCn/10snv0/LkF0zKsxj0+sJb11TkUGkgiCEEiYEZO9g==
X-Received: by 2002:aed:306c:: with SMTP id 99mr29292534qte.352.1620766462799;
        Tue, 11 May 2021 13:54:22 -0700 (PDT)
Received: from smtp.gmail.com ([2804:14c:73:9a01::1002])
        by smtp.gmail.com with ESMTPSA id c20sm16824280qtg.84.2021.05.11.13.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 13:54:21 -0700 (PDT)
Date: Tue, 11 May 2021 17:54:18 -0300
From: Lucas Stankus <lucas.p.stankus@gmail.com>
To: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] staging: iio: cdc: ad7746: avoid overwrite of
 num_channels
Message-ID: <09e65d3a235febfc4c3ee172b573ba8c9cde94b8.1620766020.git.lucas.p.stankus@gmail.com>
References: <cover.1620766020.git.lucas.p.stankus@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1620766020.git.lucas.p.stankus@gmail.com>

AD7745 devices don't have the CIN2 pins and therefore can't handle related
channels. Forcing the number of AD7746 channels may lead to enabling more
channels than what the hardware actually supports.
Avoid num_channels being overwritten after first assignment.

Signed-off-by: Lucas Stankus <lucas.p.stankus@gmail.com>
---
 drivers/staging/iio/cdc/ad7746.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/iio/cdc/ad7746.c b/drivers/staging/iio/cdc/ad7746.c
index e03d010b2f4c..9e0da43b2871 100644
--- a/drivers/staging/iio/cdc/ad7746.c
+++ b/drivers/staging/iio/cdc/ad7746.c
@@ -693,7 +693,6 @@ static int ad7746_probe(struct i2c_client *client,
 		indio_dev->num_channels = ARRAY_SIZE(ad7746_channels);
 	else
 		indio_dev->num_channels =  ARRAY_SIZE(ad7746_channels) - 2;
-	indio_dev->num_channels = ARRAY_SIZE(ad7746_channels);
 	indio_dev->modes = INDIO_DIRECT_MODE;
 
 	if (pdata) {
-- 
2.31.1

