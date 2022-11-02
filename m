Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED282582;
	Wed,  2 Nov 2022 14:09:10 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id g12so28453627lfh.3;
        Wed, 02 Nov 2022 07:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xqbSRM0xN3ReIDpRy+VRCD5PHrzF50Z7Q5uelUzp7aU=;
        b=nmw26d55ePaYauwNrDIpXKG/7dnVoq3P2mbnJGCihMWimVV1W3X7U70oo4TnfM9ENT
         eAmeFiQkaoFe5G/K0WaRzSO5wY05MSF5rz0PXcNEJjZMD5yDjZDfOCtUtQN80PQdFCco
         77BnjkxEOgbJczlZtTVPjEM9gfVAm1cB57pyYVLglbldsbSvwRn5ArmTQLstEANbWRZN
         bfLT5Zswhb5q+jfQQcZEFE4wV6s6JkpGDIoyv6IAbsHOCIxHI0j1DYsApl/BF0d7ONog
         sbxs/2C+Wfs7gfAnt3OKxPRKqHPKk85ynuwSqObV9iHpLeqohcA0BYkyDpWrZYoJTFFw
         US+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xqbSRM0xN3ReIDpRy+VRCD5PHrzF50Z7Q5uelUzp7aU=;
        b=l0N7BkqWbdZp2pOKdAJx58ppRIi3CQRRV5AM1efZgg9N8VX1A0gMtbc7xfJZgjbWqS
         +ryxyilR8XwHAE8zYNAADp3OTpLiN1cWfO6Q1DYiZyM0b8JbI+FEU2z5+7XwqYbLaCGA
         UFu/dcgmFxENChlEP+oEd8meh36RZbXVj/8B8DAVUQcws59pReiaYnc32XHx0ubWnVXF
         +R8l6kH28EaKe1lWYOT3ef5SlZ3YGzeEwzxIzLSbcj066xk0xGFwA6mpenL/KTyuiE1o
         b2OtEQwWrMhomW/wp6BZJZlpYpAb5R+lOUdjEUPef1azzPufxv3VPjhilqQGrICUB408
         n8cg==
X-Gm-Message-State: ACrzQf1EQfgoENkVD6FCJB+DKE6BbIwAy3D3kmeWBCih7uOKhT7VP2OV
	zGsRxD4d9XlCuHe/2/b8hB8=
X-Google-Smtp-Source: AMsMyM7Otr+qYHHnuPGjYtUz9lxKs430Sk37Vcw+UPQX0wfI8U4+jGcfxuROkWfRlAGGVrKZRiPWew==
X-Received: by 2002:ac2:5bcd:0:b0:4b0:d503:9afb with SMTP id u13-20020ac25bcd000000b004b0d5039afbmr5046056lfn.13.1667398148363;
        Wed, 02 Nov 2022 07:09:08 -0700 (PDT)
Received: from elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net ([20.240.130.248])
        by smtp.googlemail.com with ESMTPSA id bj12-20020a2eaa8c000000b0026e0434eb1esm119503ljb.67.2022.11.02.07.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 07:09:07 -0700 (PDT)
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Subject: [PATCH V4 0/2] staging: vt6655: some checkpatch fixes in the file rxtx.c
Date: Wed,  2 Nov 2022 14:08:46 +0000
Message-Id: <cover.1667397591.git.tanjubrunostar0@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These fixes are focused on the function s_vFillRTSHead

v4: rebased by codebase against the staging-next branch of the
staging.git tree

v3: changed the function name from fill_rts_head to fill_rts_header as
head is conventionally used in lists

v2: changed confusing changelog messages

Tanjuate Brunostar (2):
  staging: vt6655: change the function name s_vFillRTSHead
  staging: vt6655: Join some lines of code to avoid code lines ending in
    (

 drivers/staging/vt6655/rxtx.c | 48 ++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 26 deletions(-)

-- 
2.34.1

