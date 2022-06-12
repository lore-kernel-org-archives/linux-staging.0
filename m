Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81707A52
	for <linux-staging@lists.linux.dev>; Sun, 12 Jun 2022 08:12:41 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id u12so5613808eja.8
        for <linux-staging@lists.linux.dev>; Sun, 12 Jun 2022 01:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ocwZVHrRKMoztdMbvtaOW28DDsmAtKFXVot7oqF9910=;
        b=jNGvPiVjyqeVn91lEE66F5UcOu4G13hbpWEepARwjR9v+ldBUKRoLG907i3v2DNV4D
         rSdNin946G3J9XOdVJ425w6ElU88tjvmUC2wgrMYlTMfc4+oxf598xZxw3VyAXMGzueP
         cd0h+DEu3cqe/qGibY8wjNzJGvGzL+r94Rb6nsykRXRG14CeluL1wvovqtmKHvR/qeRg
         MOtGsr4fTDwfYJtdYc0hHtDB9naSV6U0kbv8CcXbcyfgmNNWZPHXwucaiOEOr6g5h1pf
         15PJhHmZkkqJs0tHxgSTRrXjz4ESev7cbqlu9m2CxTXTLXuYqSiUJ6cRkZBhuPm5Hw88
         sZaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ocwZVHrRKMoztdMbvtaOW28DDsmAtKFXVot7oqF9910=;
        b=HLPBn83h8QlHGemp7AokxUoPTYahZirY6X0Sj1AdUTEdDBEXnBdOdEZbc67lbWpWcE
         7eD7xKMV3mXMpPJ8dXvjB5kD0AVmiAknDRTBT4WHdrPd0+kORMVVpH4u1i1wKkyOfGAQ
         I6djt6PdCq5LDeL047iAmimauNHOgIufeXrexypvfIlj7zc6D+0WnHfRcyb+SlfiMyPV
         SBxbc8/5HqtyYzeDiZojqQraqYXXhAJUfWOPqmPzfNgrvTEUPxTEM5gOGll7H0+vKfpe
         xKZQeJbPlYj3/q0LscvG4KSjrkgnl+gTLF8y1ynU4F4UyCyoAzoE3vsUWWAM8Lm/rBDH
         lTDw==
X-Gm-Message-State: AOAM5318HtELiHUnK4kWHMde/HnoDotvsHNMfdL2lesQUjhVkSuhhujE
	jJ//I38gqLO3jqMpsFM6C4E=
X-Google-Smtp-Source: ABdhPJwyG8oM8ujn3e2d4TE1meBi8hyymtnPTtiqlHGv6uZFZRYCMLSfqIIsK7j8Gvv0fO++gO8szg==
X-Received: by 2002:a17:907:971b:b0:711:dc09:fde1 with SMTP id jg27-20020a170907971b00b00711dc09fde1mr26157725ejc.749.1655021559696;
        Sun, 12 Jun 2022 01:12:39 -0700 (PDT)
Received: from nam-dell.fritz.box ([2a02:8109:afbf:ed88:bcf1:6e8b:57bb:87f1])
        by smtp.gmail.com with ESMTPSA id o18-20020a17090608d200b006ff802baf5dsm2130637eje.54.2022.06.12.01.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jun 2022 01:12:39 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	namcaov@gmail.com,
	phil@philpotter.co.uk
Subject: [PATCH v2 0/2] staging: r8188eu: simplify some macros
Date: Sun, 12 Jun 2022 10:11:42 +0200
Message-Id: <cover.1655019752.git.namcaov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <YqVyGuACfuroV5ti@kroah.com>
References: <YqVyGuACfuroV5ti@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are some bit manipulation macros in r8188eu, but are only
ever used for reading single bytes. Remove them.

V2:
  - Split into smaller commits so that it's easier to review

Nam Cao (2):
  staging: r8188eu: replace LE_BITS_TO_1BYTE with clearer codes
  staging: r8188eu: remove unused macros

 .../r8188eu/include/Hal8188ERateAdaptive.h    | 10 +++---
 drivers/staging/r8188eu/include/basic_types.h | 31 -------------------
 2 files changed, 5 insertions(+), 36 deletions(-)

-- 
2.25.1

