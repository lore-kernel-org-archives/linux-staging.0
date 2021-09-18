Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCAE3FC9
	for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 18:19:20 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id n10so42275111eda.10
        for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 11:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ytz3TTUDyfzI8gNQwgvUtpk8fGA2obQJcsvCizPAUI0=;
        b=R9/okF3w/cvvXwXhCyY8qndB/lsT8busgnewl/TA9tqGAFHLC9enUUKSCIO8Pu/MfJ
         n7HQl2nwe4AJ5TxtMfoQmGY4ECM0UWoM/AH1CFPxzm3wV1qAP+BSQsgr/8/Gl9t85Kje
         iVc7Je027vtvkDJJzbSVDaSo2gItp3Mn6QwtV1QsPNhFWDr1WsIXzck6TcL/BEiG9lOe
         CFc3+3lHPFiGDC2/vNLR/aiV9bqvt8erVPGz6OE1ZxPZAIJqn5OiwjK89XpeXAbarZeG
         K0zeYiunIxQZogbk+PpKlXKeV89G9yGshR+8/+YJvcdYyNgJAwyRQYBx8JAq0ZDIlO5r
         ntsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ytz3TTUDyfzI8gNQwgvUtpk8fGA2obQJcsvCizPAUI0=;
        b=JDA9xwjLXRFtRuJ270a7qZKm0divXsnDqqNKSSTbRsRFobI/hRfeJSHy0sCe5iK8ou
         N7DpJBnPh4W4/wECUgNaQAyljM+0Y5K11biEUymMxaTYYY9KjtJd88umUHbloBpSpKnt
         D+FMBVSQ//2CYElta4NQMawfy/VuQ8r1DMaVKUohWPX336CDlXJf2RFTuAdXlEv1Jx0P
         EcIzhzgco2WJomIYYvL25xC9IUtYAUtH7Dlwj6roXG6X0w/dv4YYJyWjMJH/dovxcL/E
         hrAcrw55lZs3Vm3TPaMslSCkVOT5rrJN/PDKpvuLEeuhMMY/8uEG+Cw9yvdYH6Q/fzHf
         SmaA==
X-Gm-Message-State: AOAM531Tf+4xsBndyyfEwDA9P/uSHzMUSfFXcYazNZAqugZ3uKAUzqdZ
	ABT6xIzXUoRMp5cztfzR67s=
X-Google-Smtp-Source: ABdhPJzmGPxhyTlUJ2EEH0MWMOIsQjv/+XxQJSbLr+RWIJYs+Jswbu9086zgSs1Zfy/7RODgtI+Y2A==
X-Received: by 2002:a17:906:12c8:: with SMTP id l8mr18487242ejb.515.1631989159118;
        Sat, 18 Sep 2021 11:19:19 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id t19sm3903673ejb.115.2021.09.18.11.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 11:19:18 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v3 02/14] staging: r8188eu: remove unused macros from odm_interface.h
Date: Sat, 18 Sep 2021 20:18:52 +0200
Message-Id: <20210918181904.12000-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210918181904.12000-1-straube.linux@gmail.com>
References: <20210918181904.12000-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused macros from odm_interface.h.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/odm_interface.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/r8188eu/include/odm_interface.h b/drivers/staging/r8188eu/include/odm_interface.h
index efc2ca069a3d..d3e46b2a4cea 100644
--- a/drivers/staging/r8188eu/include/odm_interface.h
+++ b/drivers/staging/r8188eu/include/odm_interface.h
@@ -4,11 +4,6 @@
 #ifndef	__ODM_INTERFACE_H__
 #define __ODM_INTERFACE_H__
 
-#define _reg_all(_name)			ODM_##_name
-#define _reg_ic(_name, _ic)		ODM_##_name##_ic
-#define _bit_all(_name)			BIT_##_name
-#define _bit_ic(_name, _ic)		BIT_##_name##_ic
-
 #define _reg_11N(_name)			ODM_REG_##_name##_11N
 #define _reg_11AC(_name)		ODM_REG_##_name##_11AC
 #define _bit_11N(_name)			ODM_BIT_##_name##_11N
-- 
2.33.0

