Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE49F168
	for <linux-staging@lists.linux.dev>; Thu, 30 Dec 2021 17:01:34 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id n16so18651505plc.2
        for <linux-staging@lists.linux.dev>; Thu, 30 Dec 2021 09:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=sqIE3ldOgeHNddnhpAWWPYAlyFaHucud7uyIf39nJQw=;
        b=FS1Iypx6rRIN2o7+2QNHFDX6gAAVjxMV4eesKtQ81T2ge01iA2nZDS9gVmcgvFFpWw
         MpdO8RmKUd8MqG0MZeK+bu3fXkFZAVWRdPDMadjZrmcuIIrvLGR64c0xYoIznEbexP/s
         EysrgJx2g+pomImMjd/SBWFk2VLjePgzgb0uY/aVXJ1ZSq68+ZBKm5JCsCBv6Bp6cw5i
         aoRexUTr5mIJXGepii4bhdvo3B2/cjvGL+/oEK5n2UHs4c4j7ok0D/ajmrYQEqpsNOuq
         FZTn5Ke92gJyo9hd0rgBbmWAQCcK4OxuY1UHGzIxHBvQ3/EgqnpnPEBDV8hvvFSNtnqo
         WHHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=sqIE3ldOgeHNddnhpAWWPYAlyFaHucud7uyIf39nJQw=;
        b=smPPWESDAL3GMSDdiCXZYw6ybbZW/Plbwb9hLGYEwhPm2ghCyON1D1h+xCWhRMsnPv
         duA2eYhPsFrrsucvqn5xJvYliWPLM0XmXfF+sRSzrtBv0OGjtaDeG7JpFL41KbBcHekm
         tL8eaZuAEWcsf7grC1j2hsuyB2X3RLzbM7qurNVyvjBAKu3LRKCvmJSHYP7lXYpA4HkW
         8eoNQVWRRPCFFeFhwtTjELFNLsGb5kF2YxI5l7xnMpQGxuo99OElJriLzaZIzYedQh25
         AfFo9CazMvg/rDCGXSkFcUzhPZVhBp4/7pkhRIy/JSt/xKGRZGDkel36D3R38MN1XbGb
         9nxA==
X-Gm-Message-State: AOAM5337XyU1m0XttwswYU13ZkN2z4amuD6bn7sLEWNIr28jT4bcWdp8
	lLJA9UtGuN17/d3vtLbM5sY=
X-Google-Smtp-Source: ABdhPJwJqILEgA0wbUtfOFTbmdxUEKZum/AuuO+RqH9FwwFdrDJg7qgNWXiV8LcdYN9g+ZvGtjs2lg==
X-Received: by 2002:a17:902:f682:b0:149:194c:d4a3 with SMTP id l2-20020a170902f68200b00149194cd4a3mr31642249plg.122.1640883694372;
        Thu, 30 Dec 2021 09:01:34 -0800 (PST)
Received: from mail.google.com (122-58-164-114-fibre.sparkbb.co.nz. [122.58.164.114])
        by smtp.gmail.com with ESMTPSA id e16sm26380990pfd.38.2021.12.30.09.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Dec 2021 09:01:33 -0800 (PST)
Date: Fri, 31 Dec 2021 06:01:29 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: gregkh@linuxfoundation.org, paulo.miguel.almeida.rodenas@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: pi433: add docs to packet_format and
 tx_start_condition enum
Message-ID: <20211230170129.GA10296@mail.google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

While pi433 driver deals with the nuances of the different possible
config combinations, it's hard (at first) to understand the rationale
for some of the tx/rx-related source code unless you're fairly familiar
with the rf69's inner workings.

This patch documents the expected behaviour and limits of both
packet_format and tx_start_condition enum fields.

Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
---
v2: removed comments pointed out during v1 review (Req Greg k-h)
v1: https://lore.kernel.org/lkml/20211229094713.GA28795@localhost.localdomain/
---
 drivers/staging/pi433/rf69_enum.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/staging/pi433/rf69_enum.h b/drivers/staging/pi433/rf69_enum.h
index fbf56fcf5fe8..0f0fa741d089 100644
--- a/drivers/staging/pi433/rf69_enum.h
+++ b/drivers/staging/pi433/rf69_enum.h
@@ -110,12 +110,24 @@ enum fifo_fill_condition {
 };
 
 enum packet_format {
+    /*
+     * Used when the size of payload is fixed in advance. This mode of
+     * operation may be of interest to minimize RF overhead by 1 byte as
+     * no length byte field is required
+     */
 	packet_length_fix,
+    /*
+     * Used when the size of payload isn't known in advance. It requires the
+     * transmitter to send the length byte in each packet so the receiver
+     * would know how to operate properly
+     */
 	packet_length_var
 };
 
 enum tx_start_condition {
+    /* the number of bytes in the FIFO exceeds FIFO_THRESHOLD */
 	fifo_level,
+    /* at least one byte in the FIFO */
 	fifo_not_empty
 };
 
-- 
2.25.4

