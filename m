Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868CC70
	for <linux-staging@lists.linux.dev>; Sun, 23 May 2021 17:12:21 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id i5so17647084qkf.12
        for <linux-staging@lists.linux.dev>; Sun, 23 May 2021 10:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FVFwbzaqJkFQbw95QSxdKG72x5yeV8JgPBrXOT1pa2U=;
        b=TTZ3Z7RPhSXtLexI1i9Ez3Q6mw2GSrOOorQZ9Aq+R0u0SbXRK3OPck/1ARwAbenxwO
         CfCmANaKELZ0iT57dXSx0H9F96pl/Jk9BVcVigW+diVTTAIk8Ee/NDy1G3ouOT1Abfjv
         bIV/Ki6yTAjAXKMgHjIV6xp7al8d6RJndCL+2opSChmS8OFL4BIm068GL7mmQIBsLTr7
         HTBogbSyzqneISWdAQWmZxDaljut1bTYxa3OwBxX1cfXEp/6fiT+0QsLxrI29aCYqRKc
         kVZAQN0HmzjPYE7UH+2qlYqBjF2vhdTKUYmpFU3qxUdfjTOjrz5u/wCq1Kqwy1vKsuYH
         l/RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FVFwbzaqJkFQbw95QSxdKG72x5yeV8JgPBrXOT1pa2U=;
        b=AFGmPZwbsifAjsbBsFL+i6O03ekT4CUIX2GqwTpBUv2kf+0i6z4bguRK6pYzHq/FUe
         QelbQOboXOw4vNB8JMNWxjH4W2xFgnbPFQREvIMO4c7cF85wK938IqBOgS10UCBpfR3L
         PNXN5qtAVYlBdoK6i34DXjoM/gKPUsZA24ZEuz2gvMY76BKvwGrPAK33uv9F943/KiBF
         LF6Qkfu0s1c16HvnlHPArwAbn91b6xqbS7u7zOMC7pLunqUQuhQ+bcJsny6Yl04Tqcug
         in626tuQ8C7jwr+6nbNyxXKOhpC9Q/QO5gwrtohrK6dR8LHnyyBKvfdcrjoiJukjeNDh
         FCsQ==
X-Gm-Message-State: AOAM531L2gqpY4n5WZfeYJAc11i5okVmb2/8x2I/PyT4Z1cevq2rDsYv
	Oz9oK05sbPi+WFOYg5ta1Nk=
X-Google-Smtp-Source: ABdhPJxegZy9XqDTwQ82b4AgKjzCAY2P7VQFa9Wik5QZofZ583lov1CO3I1oQIEp0eivCXwoMMDRFw==
X-Received: by 2002:a37:b947:: with SMTP id j68mr23579888qkf.108.1621789940745;
        Sun, 23 May 2021 10:12:20 -0700 (PDT)
Received: from smtp.gmail.com ([2804:14c:73:9a01::1003])
        by smtp.gmail.com with ESMTPSA id x28sm8975699qtm.71.2021.05.23.10.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 May 2021 10:12:20 -0700 (PDT)
Date: Sun, 23 May 2021 14:12:16 -0300
From: Lucas Stankus <lucas.p.stankus@gmail.com>
To: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] staging: iio: cdc: ad7746: clean up probe return
Message-ID: <45443b8306893576824effaff57d40231de8e813.1621786036.git.lucas.p.stankus@gmail.com>
References: <cover.1621786036.git.lucas.p.stankus@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1621786036.git.lucas.p.stankus@gmail.com>

Slight simplication of the probe return on device register.

Signed-off-by: Lucas Stankus <lucas.p.stankus@gmail.com>
---
 drivers/staging/iio/cdc/ad7746.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/staging/iio/cdc/ad7746.c b/drivers/staging/iio/cdc/ad7746.c
index 12b2554a85b5..367a5990ae35 100644
--- a/drivers/staging/iio/cdc/ad7746.c
+++ b/drivers/staging/iio/cdc/ad7746.c
@@ -734,11 +734,7 @@ static int ad7746_probe(struct i2c_client *client,
 	if (ret < 0)
 		return ret;
 
-	ret = devm_iio_device_register(indio_dev->dev.parent, indio_dev);
-	if (ret)
-		return ret;
-
-	return 0;
+	return devm_iio_device_register(indio_dev->dev.parent, indio_dev);
 }
 
 static const struct i2c_device_id ad7746_id[] = {
-- 
2.31.1

