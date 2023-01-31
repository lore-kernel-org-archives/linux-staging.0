Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DB2622
	for <linux-staging@lists.linux.dev>; Tue, 31 Jan 2023 02:11:42 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id k4so2254439edo.12
        for <linux-staging@lists.linux.dev>; Mon, 30 Jan 2023 18:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+Jb+MSes6fGmewF1s3qNmS+/O55QAvEL9+JjECno9v0=;
        b=VoTQ2CwZGG8oPU/F8Phav0VrFlmZ/fJg8fKU3MW20abfWERbbX8Oc3+A9UPBgCUBxg
         kdOYHcSuhn/RJjcgJuCxYJJ59ayX0OiIR5I8OqUhPjnW3Ek4Q+bPS3s5/tn2SvB5k6tE
         eDaMhY1xOyl8e0AwhWGQC35l1eV+QoEhf/UeRTNMLez/fReIoPxAJ2af7lHQu/687zko
         o3rzOLgtyQpKM5+ACw14xY23P9iMOf1qv1LbyOnMb8zOlVZtHKdIVEhYnCPMxClTu7ON
         liZwEpPDK9EuHCBh5hDb5+SXnR/fQ4YiJOPgNwtSw0AWeexGuYa0ghnb9CAyEf2itTER
         TgQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Jb+MSes6fGmewF1s3qNmS+/O55QAvEL9+JjECno9v0=;
        b=PqB/SAdKtU783pmhCJ1y/lvt01473HVB9qK1vg8qdXsJx4r6QDe1bi6IQRusMx6nJo
         lwCRI36u8fDarOd04MtXoBIJCA51zIAQ1gheiLZSDWb7jAU6ukT/WmTR6OrLNIBISSNp
         sgd94VOuV8Ru6qavLXQz38cUl6kMfTCKzxw5peS3UWxdcVsYFkwPL/jCyJjru+o0TSK+
         0fOgMO7Lhc0VguIY45WEelv7JjacX0DOpPNqEfe/oCRxJyvIDXhYfRUnQPrgdmjbEr51
         2vtOV2GpvS49BDneA0UuE7TmG7Us32j3RpRpy7sPBIAfdUVzLfIYaf3IUhuOtWkcMcUR
         ds1Q==
X-Gm-Message-State: AO0yUKVGgO0QRvpjvVxpjD86lsjncnm2lX25Z0MP5v6GYrSjteJcK44q
	STJlMZxmcTFbS1HUJvStMag=
X-Google-Smtp-Source: AK7set+asRJM3XP9InXpn/F110xfk8v8lKMszcdFQymjgrbiA1VfQJ0D8NqDMwS9SeQ/lIH5dpOBoQ==
X-Received: by 2002:a05:6402:1d89:b0:4a2:6660:8fbc with SMTP id dk9-20020a0564021d8900b004a266608fbcmr859285edb.40.1675131101134;
        Mon, 30 Jan 2023 18:11:41 -0800 (PST)
Received: from combine-ThinkPad-S1-Yoga (c-8ff371d5.879159-0-69706f6e6c79.bbcust.telenor.se. [213.113.243.143])
        by smtp.gmail.com with ESMTPSA id l3-20020a056402230300b0049f29a7c0d6sm7697966eda.34.2023.01.30.18.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 18:11:40 -0800 (PST)
Date: Tue, 31 Jan 2023 03:11:38 +0100
From: Guru Mehar Rachaputi <gurumeharrachaputi@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: pi433: modify bit_rate from u16 to u32
Message-ID: <Y9h42l/8EcPqn63x@combine-ThinkPad-S1-Yoga>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

(struct pi433_tx_cfg)->bit_rate is modified from u16 to u32 to
support bit rates up to 300kbps per the spec

Signed-off-by: Guru Mehar Rachaputi <gurumeharrachaputi@gmail.com>
---
 drivers/staging/pi433/pi433_if.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/pi433/pi433_if.h b/drivers/staging/pi433/pi433_if.h
index 25ee0b77a32c..1f8ffaf02d99 100644
--- a/drivers/staging/pi433/pi433_if.h
+++ b/drivers/staging/pi433/pi433_if.h
@@ -51,7 +51,7 @@ enum option_on_off {
 #define PI433_TX_CFG_IOCTL_NR	0
 struct pi433_tx_cfg {
 	__u32			frequency;
-	__u16			bit_rate;
+	__u32			bit_rate;
 	__u32			dev_frequency;
 	enum modulation		modulation;
 	enum mod_shaping	mod_shaping;
-- 
2.34.1

