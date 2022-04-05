Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B9B15A7;
	Tue,  5 Apr 2022 03:16:19 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id v15so9338012qkg.8;
        Mon, 04 Apr 2022 20:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WNYZrXIYQcYX1eT3yCDusiEgOPOnE1Uw+GVsGFSpvGM=;
        b=HhxfV7d6F24BtgCoeDYr+W7Q47h1cTnbmTNsJshOBMLDA38QSVFzUF3qXChkZsA+qr
         YK3Sjoi5bfRiyCPNzFPnu0paWDNMgKhoWxfzCRTecppdzgxPsNfHL4LkMZWvatE0ug6h
         roYgPaS5CL79KQ4u74x38nZ48nuRxQN1Uz/CcAnewdhDMrRC7bIn9ITILDIEYaPUB1wt
         3Hh+pBgFKAp8CjqulWWxIWJHBKDOYUC4/Uu/OEuJRUUsacof90rPvTQ4rJnOaQWWB9Sh
         bH3tnwQRi3eTNV1wu4HaErVRwC3ovYdXbqf/PWh5I6dyK+GRz1TqYLABsUPmmsqbkxpJ
         JaAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WNYZrXIYQcYX1eT3yCDusiEgOPOnE1Uw+GVsGFSpvGM=;
        b=Pu2otO7ozu0TIMR6QPPjKkyFuUpdcM278TXtdqAGFHTWSIIlshxalN3/LWvvsD9XBs
         5t7xHJ+C3MGek+8kZl8TfTJTXFILN+XQ2h+4657KfEB9o4NisxHfQL6tSmeCBH+AoCb2
         u4ZRnQEwcvcB3jVNeIW1pJFEutBnPcA/2IUkMignRSl5BRVzxrHoySPqaP0XIB1Waj3u
         KBHmHoIvnIWXuGvfwoSZUoBHhdGxVZZD82xPqjWNIXhjW3DeCjjaJfOgIqsnGco/ae7N
         IjFGNkT7kiLAY8QSz/3LJFMFayOoyUFG9FOBO/T1yVcW1d3Lcnh/CxxUP7nOcX2YXLJe
         MNYQ==
X-Gm-Message-State: AOAM53146D0YxGAB87N/grEucevoKEoshQesX7b7B89//28GtNx0RmBH
	PmJ3dFeyTTlN0i/P6B4vI/8=
X-Google-Smtp-Source: ABdhPJzzb9WkNhmQTDeNSDHP3FiLGAnOXs/XSaQsG23mfQpUq1r3ZCtsTczE1LWyAjyfsQjbjckwsg==
X-Received: by 2002:a37:a64b:0:b0:47c:3ad5:bf8c with SMTP id p72-20020a37a64b000000b0047c3ad5bf8cmr952478qke.13.1649128578395;
        Mon, 04 Apr 2022 20:16:18 -0700 (PDT)
Received: from euclid ([71.58.109.160])
        by smtp.gmail.com with ESMTPSA id m10-20020a05622a054a00b002eb965bbc3esm10337420qtx.93.2022.04.04.20.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 20:16:17 -0700 (PDT)
From: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
Subject: [PATCH 0/5] rtl8723bs cleanup
Date: Mon,  4 Apr 2022 23:16:07 -0400
Message-Id: <cover.1649128267.git.sevinj.aghayeva@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These patches fix five categories of checkpatch warnings, such as redundant
braces, and redundant else branches in file rtw_mlme_ext.c, which is part of the
rtl8723bs driver. False positives, such as

if (foo) {
	/* TODO: ... */
}

were not altered.

Sevinj Aghayeva (5):
  staging: rtl8723bs: remove redundant braces in if statements
  staging: rtl8723bs: remove redundant else branches
  staging: rtl8723bs: remove return from a function returning void
  staging: rtl8723bs: fix indentation
  staging: rtl8723bs: remove space after function name

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 160 +++++++-----------
 1 file changed, 64 insertions(+), 96 deletions(-)

-- 
2.25.1

