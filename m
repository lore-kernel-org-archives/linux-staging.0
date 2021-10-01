Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77473FDF
	for <linux-staging@lists.linux.dev>; Fri,  1 Oct 2021 20:26:03 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id r18so38793236edv.12
        for <linux-staging@lists.linux.dev>; Fri, 01 Oct 2021 13:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yOFCqjCsaIkGC0GztDDOH3O6ih5px6ECSue53rP82kU=;
        b=NnJZafKHRYxx2UF8EtQz8KtZ+o/7ZURng4/muTjwBgZ8zD9dj7NlQ0JwAtSY/2VOvw
         wM7Kw6eU16QuiCvmkGJaijk0lvLXmFA31i06/tgJ6L90DgPe4za5K+57nukhr7nKaLm7
         vYWaRmJ/cuPGSonNiARKS0MeZ3tFuP4R29QFlIq/cpfnf+07kpnBMtP53mXIS0F4Me8T
         nm89lfGCc61AmxT/izSC65Dp1Hb0Vej8MyAtaZKBcQAC4wZBdNCtJ2ogPEPAjJ2/geQG
         gULyoutc8yO1IOhOY4StSZanr996MLZoz1Jkylm9rM7QuMLLUq3kGlk6+BHaojF/xXwA
         KisA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yOFCqjCsaIkGC0GztDDOH3O6ih5px6ECSue53rP82kU=;
        b=BPveVRejGA8wSxHwZu3QJzuNzxvi+VzHhtsvUVQqDbYMAeDXbMqHanOo35/6lN1h6G
         Wu46756/bKsGT2WOaIQyr7XtybV9qGewsowe1ilHKBLUnfGOkrBIvgSWknB1pGQ8jCZ1
         POCJw9r21H5TJ6qd2CAF7VQAWGiDgArAivPzyIkGYobPkpBkXfYqaAx6E8xnoOgsrgsJ
         mHMMQq6SS5UTS3FCwar4mFolZB7igQMgMS/G4FBP3KfvguORO9k8JL8KbTzpwq3bLLBC
         TbNDnQj+1Zj6f7Up71CAx67x0zII+W1mjporv46SjFGRnxPM4qM0EPj5wTCgP5YNSj5j
         eKdg==
X-Gm-Message-State: AOAM531CNa1IvWFOU7KbXqkRi4fmcsLtWTOMEclFgR89E+mP6aAA5aul
	CcrNyU+IrGkkBveigBGMoYA=
X-Google-Smtp-Source: ABdhPJwpRaSQY40ta/5LIKqezd8FR2LGmiFwLQg1NWYet4VWq6TUi1fqZObBubZ3rCIPPFU65swW4A==
X-Received: by 2002:a17:906:b14d:: with SMTP id bt13mr8429247ejb.39.1633119961954;
        Fri, 01 Oct 2021 13:26:01 -0700 (PDT)
Received: from tom-desktop.station (net-5-94-68-71.cust.vodafonedsl.it. [5.94.68.71])
        by smtp.gmail.com with ESMTPSA id b13sm4800317ede.97.2021.10.01.13.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 13:26:01 -0700 (PDT)
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: 
Cc: tomm.merciai@gmail.com,
	Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lucas Henneman <lucas.henneman@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: vt6655: fix camelcase in pbyCxtBuf
Date: Fri,  1 Oct 2021 22:25:01 +0200
Message-Id: <20211001202504.410383-1-tomm.merciai@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace camel case variable name for variable pbyCxtBuf
with snake case equivalent, in mac.h

Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
---
 drivers/staging/vt6655/mac.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index 9797eddaea01..3043d2813074 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -886,8 +886,8 @@ void MACvSetLongRetryLimit(struct vnt_private *priv, unsigned char byRetryLimit)
 
 void MACvSetLoopbackMode(struct vnt_private *priv, unsigned char byLoopbackMode);
 
-void MACvSaveContext(struct vnt_private *priv, unsigned char *pbyCxtBuf);
-void MACvRestoreContext(struct vnt_private *priv, unsigned char *pbyCxtBuf);
+void MACvSaveContext(struct vnt_private *priv, unsigned char *cxt_buf);
+void MACvRestoreContext(struct vnt_private *priv, unsigned char *cxt_buf);
 
 bool MACbSoftwareReset(struct vnt_private *priv);
 bool MACbSafeSoftwareReset(struct vnt_private *priv);
-- 
2.25.1

