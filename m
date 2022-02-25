Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCF01FBD
	for <linux-staging@lists.linux.dev>; Fri, 25 Feb 2022 12:09:06 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id x5so7089464edd.11
        for <linux-staging@lists.linux.dev>; Fri, 25 Feb 2022 04:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6XJhj8Ihrmjop5X3+642va1C/5EerFs3iFnEeb2jMrk=;
        b=TU/U9yonfzdoh+W/c31bXdpOoW3PUzuJGrYRhaK57eOG2cLFmWMpICy5frtUBhfWx3
         efmruOfnTV0AV3FX0Cevw1bfPHNDRoOsudb5fG+63KY034+uKCTI0iAIPeMo3pVgyIfF
         XsrV4eHOfPMPiPROtmaTF/lxceo4nnGPQtZ5DZA8TJkOKK0m9tynKQfrptpflsDPOBT8
         Qgg+o/N9t/bUzMzgYIB+LUszkQoPql2SNj7BBBqoND7nWtGXiPS2g1H8kAD/RqLpXU2s
         U2sKb53gV1LkglUHtvh0CcxchQlNj5Ev3ZyHvnC5qb46eqesPdf9lqk/8ZTkpjp5ei7S
         mkCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6XJhj8Ihrmjop5X3+642va1C/5EerFs3iFnEeb2jMrk=;
        b=FpvvVSRJmo/y36aUQNs4qS5W2J37peKlQewgml4OdW2C5QHkyIxbTCJPkqZ+dWFHpl
         us+XSOHBu+6Ubz7TeWxxIlS2qcwhQkl4tDNTWi2uo4ED88C1c6PhtwV38MmH9yf6qlZO
         1UEF8Jlvd3wgADIhUueG/Abzf57/RabUc48u6+g/K77dQe8/OkZW/Byvlcf7umPYpl/r
         Ed33/GfHgCD2qn089BRR071zygFHpi/wtiRRoBgZv2U+2S1PtuQKAM95pPN7wv1En7Ly
         sYv4GYA4xE9kldvdDTyZ7A22Vk/ujYqf9zuhgB2me3aGyfk7vikV8D25fXANDWRSlJWF
         1hgg==
X-Gm-Message-State: AOAM533CcVYcJVVVbLoMKNsCgRCjvvNh7/hZAQ9YgaRPtAwkBY1t3/Wu
	yOESkzj8/WZD/cBLq3FMsZY=
X-Google-Smtp-Source: ABdhPJwW7Yg7ntU+LnpT67TARcf5Ibm+DImGDxt1HBzWYrUUV79XSKrgb13C7bASPEaGZCpnM+OTdA==
X-Received: by 2002:aa7:c0d0:0:b0:410:d576:8808 with SMTP id j16-20020aa7c0d0000000b00410d5768808mr6868476edp.340.1645790944825;
        Fri, 25 Feb 2022 04:09:04 -0800 (PST)
Received: from localhost.localdomain (ip5f5abb8d.dynamic.kabel-deutschland.de. [95.90.187.141])
        by smtp.gmail.com with ESMTPSA id y14-20020a50eb8e000000b00410a2e7798dsm1229418edr.38.2022.02.25.04.09.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 04:09:04 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 4/4] staging: r8188eu: remove ETH_ALEN from ieee80211.h
Date: Fri, 25 Feb 2022 13:08:43 +0100
Message-Id: <20220225120843.10674-5-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220225120843.10674-1-straube.linux@gmail.com>
References: <20220225120843.10674-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The definition of ETH_ALEN in ieee80211.h is redundant as it is an
in-kernel constant. Remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/ieee80211.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/r8188eu/include/ieee80211.h b/drivers/staging/r8188eu/include/ieee80211.h
index 1793b99feb9f..3a860e132cbd 100644
--- a/drivers/staging/r8188eu/include/ieee80211.h
+++ b/drivers/staging/r8188eu/include/ieee80211.h
@@ -11,7 +11,6 @@
 
 #define MGMT_QUEUE_NUM 5
 
-#define ETH_ALEN	6
 #define ETH_TYPE_LEN		2
 #define PAYLOAD_TYPE_LEN	1
 
-- 
2.35.1

