Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F517474
	for <linux-staging@lists.linux.dev>; Wed,  8 Feb 2023 18:56:49 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so2186874wmb.2
        for <linux-staging@lists.linux.dev>; Wed, 08 Feb 2023 10:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XIo7KpMDaRfgRZgMFrjY9BiU3ZghspQ14enw5m/OmAA=;
        b=OTaIzU5p4Vm1ss7vcxGXZ3O5xVEX3TMR7EvPLga0WhoDWNy3jIevXkrXc9T6IOQjjh
         9GaCCaN2SV9daZjVsmSs3EIR4Q9hkBamEM21uUfYBpsqF/JEM8SnL8NE2Nxd/4j6aeMC
         /g8LyRMMqJDBZgkaq+9r5dtP+ZFPqK+81bhGGvatxqZigVHIOX2CkbsaNRAN6OBe2uJU
         Cpp47s6HpS03YlhyTX28n2wpGWf9bqWaiDsdWmBOwfkmLsrt0bZrTAHxD4v7sKuEtvOS
         qcY5NI++ZIqwQpjMEWQYYXsysgFm095LWGKuqGqtuekvzM1WCU41QqeIKXNS+vmNCF1a
         khcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XIo7KpMDaRfgRZgMFrjY9BiU3ZghspQ14enw5m/OmAA=;
        b=UT3NDTVEoefYnS9AWvPd6kSe7AMoKuCN3Efyaay9/uiyD+L0d+Wk/ledEhWfXy4djy
         FRoy35H0Wfenu0GH3nvzHryzIq0WN+33P9i3pgVF8brrhcqGHCtBVFbokvg+dOTiDkhO
         klChXdcWL1rM7B505xS6jRrGJoIPsbfuytaeK21DNkBneFTroHqcCZccBuQAacxUce0P
         FeTL7b7nkYDxJU9nJn0buWoz6hSWU+dOGeGD814cb2aygnwJoAhQNNE/ICz7TF6zUH4G
         WZZnnMmhdOEiuWLaesLBF7jeQAWZG2c9e3YVAW7QvA5XUlZww6futSJlptdiADnGNOmd
         hZrg==
X-Gm-Message-State: AO0yUKX5x+eOxAOQoFivCOWwRoOBFq9MXrLvw70R62Z95HE9Kf0dlvXW
	pxM6iiZsJia3r4aa9uCUqx8=
X-Google-Smtp-Source: AK7set/uBlZSZYh1C+IATXeS4vCMbRtg1YBmyDu6zO7dNNFDogmatg3TZeg0mxOsh9xPeAuLQt2d4A==
X-Received: by 2002:a05:600c:3ca3:b0:3dc:5ae4:c13d with SMTP id bg35-20020a05600c3ca300b003dc5ae4c13dmr10206985wmb.4.1675882607938;
        Wed, 08 Feb 2023 10:56:47 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id r13-20020a05600c35cd00b003dc433355aasm2698984wmq.18.2023.02.08.10.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 10:56:47 -0800 (PST)
Date: Wed, 8 Feb 2023 19:56:45 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: rtl8192e: Use BIT() instead of << for bit field
 MSR_LINK_MASK
Message-ID: <20230208185645.GA14681@matrix-ESPRIMO-P710>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Use commonly used BIT() macro to define MSR_LINK_MASK. Equation is
not accepted by checkpatch because of missing spaces. Therefore line
needs to change anyhow.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
V1->V2: Changed patch, title and description
        Calculate MSR_LINK_MASK ((1<<0)|(1<<1)) = 3 is not wanted for
        bit fields
        Old patch name: Calculate definition of MSR_LINK_MASK
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h b/drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h
index 8b8a870fcbbd..99640c4779f7 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h
@@ -170,7 +170,7 @@ enum _RTL8192PCI_HW {
 #define	BW_OPMODE_20MHZ			BIT2
 	IC_VERRSION		= 0x301,
 	MSR			= 0x303,
-#define MSR_LINK_MASK      ((1<<0)|(1<<1))
+#define MSR_LINK_MASK		(BIT(1) | BIT(0))
 #define MSR_LINK_MANAGED   2
 #define MSR_LINK_ADHOC     1
 #define MSR_LINK_MASTER    3
-- 
2.39.1

