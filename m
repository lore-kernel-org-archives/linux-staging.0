Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB0B168
	for <linux-staging@lists.linux.dev>; Tue, 18 Jan 2022 23:04:19 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id q25so724883pfl.8
        for <linux-staging@lists.linux.dev>; Tue, 18 Jan 2022 15:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to;
        bh=vmI5obZJChROSVQzReKLArfFA6O6EbFVOPbqT4ROOPo=;
        b=QfQD1u5VB3E351cX8YrjWGZk8vfWE2crrmBoY6ipDg4SX2/GS7Uck5C8/8Ixyl/ee6
         5RwrN57TS0g+L9P/syCEvZqk3jluxNUUZuyAfiG3xxUYULGwOJOOuqCc82sm7+BwX3M8
         uy83V4j/0LH7R2BhpkH71Jf/XHK5C5M7SnUlJFhokGszQ5UE6bb2OJLwiDN6rjwC7orl
         YvDv0rY6byus6J8y3Eyq5xO2hbztgN95nVDx57MDOsvjMyPjZGX2NeHSlxDCyrrP2gqR
         0sEm+3hypvO86f1fGdg4wQJxJ/utQ8csuzhfsQrj3pgNEuPaiGB8UyU8fC3AiRsRZvtH
         9Vvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to;
        bh=vmI5obZJChROSVQzReKLArfFA6O6EbFVOPbqT4ROOPo=;
        b=JvQ6FtG5oEQ/TA0NVXUYIsE6Iv7VBsoSAP9moviIZduDZ2N/8whNmRg7wTnYexLbk2
         T8GrK635NMggYORup/UuGOdICpImiOV/TeiHh+1OnFamMDOWh12qM1cEjFnDPCOINlgZ
         zdR7PHkVkyvinI+EF42sRXcrk/OBpcTQGTxhGjB1/IO6gm3aDc7xFEfPPe4q8FaNtSxd
         Pm9YCFYRPK5qltdJkG9qsT73r8NNIL2GQV2MOLQ5guxVuKR4sCtLcUjd1oVylD5l+bUM
         pHXelEvtfrTLjjqRH/2Ndf6JXII+245dhk5edrJUM+wdyqof0zHCkD3qV0pIioxtiBio
         5m9Q==
X-Gm-Message-State: AOAM533DYmTbEd33BRtknI1t+d1mjswDuYw0Ej761OiDYiBvXWwRs3zS
	tpVHt/rQzY2UQP+oOofoPH4=
X-Google-Smtp-Source: ABdhPJw+EJr9CIkmWZMT2kuFRRthOjv28RD0JsJY7pNppfXdsHHhYSV2ChZdm54sofXo+ulJRhvEMg==
X-Received: by 2002:a62:1c12:0:b0:4bc:6d81:b402 with SMTP id c18-20020a621c12000000b004bc6d81b402mr27869091pfc.40.1642547058817;
        Tue, 18 Jan 2022 15:04:18 -0800 (PST)
Received: from mail.google.com (122-58-164-114-fibre.sparkbb.co.nz. [122.58.164.114])
        by smtp.gmail.com with ESMTPSA id x15sm20422153pfh.157.2022.01.18.15.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 15:04:18 -0800 (PST)
Date: Wed, 19 Jan 2022 12:04:13 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: gregkh@linuxfoundation.org, paulo.miguel.almeida.rodenas@gmail.com,
	realwakka@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] staging: pi433: fix validation for min bit rate
 supported by the device
Message-ID: <20220118230413.GA4859@mail.google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220118230312.GA4826@mail.google.com>

rf69 datasheets establishes that the minimum supported bit rate is
1.2 kbps regardless of modulation.

this patch replaces the errouneous validation with the correct value

Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
---
 drivers/staging/pi433/rf69.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/pi433/rf69.c b/drivers/staging/pi433/rf69.c
index ee8c81d164e1..f4ac17adcd83 100644
--- a/drivers/staging/pi433/rf69.c
+++ b/drivers/staging/pi433/rf69.c
@@ -226,14 +226,12 @@ int rf69_set_modulation_shaping(struct spi_device *spi,
 int rf69_set_bit_rate(struct spi_device *spi, u16 bit_rate)
 {
 	int retval;
-	u32 bit_rate_min;
 	u32 bit_rate_reg;
 	u8 msb;
 	u8 lsb;
 
 	// check input value
-	bit_rate_min = F_OSC / 8388608; // 8388608 = 2^23;
-	if (bit_rate < bit_rate_min) {
+	if (bit_rate < 1200) {
 		dev_dbg(&spi->dev, "setBitRate: illegal input param");
 		return -EINVAL;
 	}
-- 
2.25.4

