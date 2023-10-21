Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD8D626
	for <linux-staging@lists.linux.dev>; Sat, 21 Oct 2023 00:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d/0+ogNq"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5079eed8bfbso1930590e87.1
        for <linux-staging@lists.linux.dev>; Fri, 20 Oct 2023 17:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697846632; x=1698451432; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AR8e7uCgcxmCZgrEGCaXPBiQuDpmbbSbir6TORqZhQU=;
        b=d/0+ogNqzJ1PHmmFhKLdzSknttvkg5NklLexhagEmzLsk79pS956HkhuMJiA0+OuJf
         tTGEq9Yf7O6inxnnBefjC5Hvx+4a+mO+zEL7nwDdcFFMU4OdauIFYuxsvSSV8AzCnvhk
         hsfSk9YuzMo+mczfQ1eDBqbG785t8FMY/wTpIGBQ71iKOOQpAhGAaxuF0x2p8A904+g2
         9V2oiwN8DhA4hy/GhQ3VEg0DEW4NLoFSOH+z8jIES2FF8oWR0eHvvO2mEek/4S2jr2hR
         AQ1yHG3K4JcmjALF9WxH+J3VEQy4p/wMzX8ojxdHM6E6C36Ax5x6uwhwo4L1ZOmsreoF
         cNaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697846632; x=1698451432;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AR8e7uCgcxmCZgrEGCaXPBiQuDpmbbSbir6TORqZhQU=;
        b=NjMzNwpHVmmMNwCgSy6KLokFqsk65HNXhgsUKPIXHm/2QF2iYyeLXgdjQY1FxbNGhq
         si9sjLuYl8/XrKwM5iTQH17qbf8g3kLe5vQLO/VI9pkVzuyltQfoL47TQUcv8r0yL1YO
         /+09XYiBJcH9gRY2aLAj79zSGH4ieaauQIiRZQcyan/uC7pdXPqcIi7rf/YvUyo2/ZpY
         uMNy8skL6PJJJOZD2AjpSs7qcI9XMdryfgX1aSB+52/nw3BZkwvivACSCmUftz8KJr4z
         eWA/GGAXH2aE0Dp1rQfu9ji8r0SNxZbjagWxjDBIBf4DfxTsk1Vts2eZW0yeKs8YCwbp
         sSCg==
X-Gm-Message-State: AOJu0YyzNkkmfQJVMoeie6rNelX0/z+ZYvUgUTtXNQImUVnb0dNwabxA
	ZXKA27tVLCPkoFGK+ghxASk=
X-Google-Smtp-Source: AGHT+IHfYKCIs9ScRFBFFZICOKXVdA1RaCumuqBlz+KCJUAO72clcSBdTgb4/jK/+xv5Ku3VIYWrEQ==
X-Received: by 2002:a05:6512:70b:b0:507:a1b3:2d47 with SMTP id b11-20020a056512070b00b00507a1b32d47mr2080809lfs.17.1697846631742;
        Fri, 20 Oct 2023 17:03:51 -0700 (PDT)
Received: from HP-ENVY-Notebook.lan (81-229-94-10-no68.tbcn.telia.com. [81.229.94.10])
        by smtp.googlemail.com with ESMTPSA id n13-20020ac242cd000000b00507ce48e283sm595463lfl.206.2023.10.20.17.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 17:03:51 -0700 (PDT)
From: Jonathan Bergh <bergh.jonathan@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jonathan Bergh <bergh.jonathan@gmail.com>
Subject: [PATCH 0/2] Fix instances where new typedefs were introduced
Date: Sat, 21 Oct 2023 02:03:38 +0200
Message-Id: <20231021000340.56889-1-bergh.jonathan@gmail.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These patches cover (first patch) the declarations where the new typedefs
were introduced (they are removed), and then the cleanup of the inline
functions in the same file, and then the second patch cleans up the
ethernet.c file where they were also used

Jonathan Bergh (2):
  staging: octeon: Fix warnings due to introduction of new typedefs
  staging: octeon: Fix remaining istances affected by the removal of
                   typedefs

 drivers/staging/octeon/ethernet.c     |  6 ++--
 drivers/staging/octeon/octeon-stubs.h | 48 +++++++++++++--------------
 2 files changed, 27 insertions(+), 27 deletions(-)

-- 
2.40.1

