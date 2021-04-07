Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BEB29CA
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 13:50:00 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id i18so14618257wrm.5
        for <linux-staging@lists.linux.dev>; Wed, 07 Apr 2021 06:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E/ENy3CBjvmg/J8qPrFD4l+ic8WZcpLDX80h6j6fkBs=;
        b=u+XZvMa07etK42qOniMbGWyHbMzfRhh+HHQM71X3IyxvmQWpDrGi8wMKtcrIEb+Ekq
         c5USHX1VQW6QE5p7jZe5dUCnaO32k/IWeETp5wRm4dVOsUrmCBr6Af9lp05p5zhEj7a0
         K7AGGs0sIRqiaD+YwsiSCsURIjLOZzB/8hTce7mY2tAOUlCWJ1pD95wosdgOENekZjB9
         uMOYNt1pQynJct5Nh7Us6/v4dzs9/ihkdPIOmVECqonBPDHq4w/viw+3SqBNJO/PrY1E
         vH8wP8VnNGo00PPrPe2wge1KvEvZ9py4xhR/TN+l6yoUw9M9SXpIzmlOiAQHQIsYohE5
         SAbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E/ENy3CBjvmg/J8qPrFD4l+ic8WZcpLDX80h6j6fkBs=;
        b=Cuf7+XrhYzB/jPIozGLdhXtQ7BF1DJbTJrnEvp5AcsN0pe7ZGUX62WAqQX+Lx1Alxr
         3BunGTpDgtE8zdzLspVWYDq0uwLVGULHRn8mu5hxNtczUDrTLcmIRsNP3XLjLsFugYlr
         Q1/+mW/JuiNX9d5WiW1ZEFZtjsYlCxGlnn5wX5mHTxmxrNygCvimUqr0YxTycVDoaS23
         J0cqyv+9aqAAKj1vJrw/tSJrvRkKtfeT7MCT0eKgldimIl/PAxR44vWnYUERjCJjE9f3
         SjC7Zp3wHmGMpvFdDuGOUCFCPw+SRTOvfAK1wvYY0fIy/VTJoK+x1rUKob9/lX4VIrY6
         +cRA==
X-Gm-Message-State: AOAM532fTn49BGDaz0F4ewtKpoYp//LbuK7UUtHUxvI/XC0SCTEVosPQ
	qkNrb1HbSqRHZy+dtmL5f48=
X-Google-Smtp-Source: ABdhPJzXSPBnS0nsniUN9R2afkN9pF1DEIOiWOT8atGlrgJQok8AjRy2431IwjURjACOb3rMnbd/Eg==
X-Received: by 2002:a5d:62cc:: with SMTP id o12mr4558682wrv.95.1617803399064;
        Wed, 07 Apr 2021 06:49:59 -0700 (PDT)
Received: from agape ([5.171.81.68])
        by smtp.gmail.com with ESMTPSA id z1sm10477874wrt.8.2021.04.07.06.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 06:49:58 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 03/19] staging: rtl8723bs: remove DBG_871CX log unmatched by cocci
Date: Wed,  7 Apr 2021 15:49:27 +0200
Message-Id: <740bf0eeef550de36e772bdf7d051499627773e5.1617802415.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617802415.git.fabioaiuto83@gmail.com>
References: <cover.1617802415.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove a DBG_871X log untouched by cocci, maybe due
to the presence of a trailing \, for it is inside a
macro definition.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index e3dce1b2e553..b26da309f54d 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -701,7 +701,6 @@ void sa_query_timer_hdl(struct timer_list *t);
 	} while (0)
 #define set_sa_query_timer(mlmeext, ms) \
 	do { \
-		DBG_871X("%s set_sa_query_timer(%p, %d)\n", __func__, (mlmeext), (ms)); \
 		_set_timer(&(mlmeext)->sa_query_timer, (ms)); \
 	} while (0)
 
-- 
2.20.1

