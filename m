Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA0F72
	for <linux-staging@lists.linux.dev>; Fri,  7 May 2021 07:36:03 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id o127so4649186wmo.4
        for <linux-staging@lists.linux.dev>; Fri, 07 May 2021 00:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UpLXPBEca00X1jt2BN5Po39enJc5MfLPxoMSCRbIJjs=;
        b=lkCNWke4nt4qvL/3A89p2+OV9OrOjUnPpf2JQBWj6b5CaqFLacdUCysNuSmH860Hsi
         eie4XrwdgPinHZmI8RtAU/y11UJW6fnkB/0nwz02q1VW1AdBbsjECL9YYpMIZ2sGuiLI
         se3HcC5hyu2q7/32q+lFAei+IETcbhmp7XiJVRP1Pb26iY6mGJVjLA0BdoZk36UmlUtA
         DpO34NbNBAlEl5+9wsAQo+aqkeaSm51vTAB84eeeRGb5K20U+87Y3lsZvZd0BQvFbKJB
         cvvD6a92uJgsYb9rmQL2NpG56YaNST4HCBvg/nSuSc9tKArdP9KyovYnkdombgMeTgOe
         53JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UpLXPBEca00X1jt2BN5Po39enJc5MfLPxoMSCRbIJjs=;
        b=c9BDRuIVAdp8nAUm3HTIKo20aq2oRlL5zQ8Y/YWB+zRH2MNZeowfkjALyvHc2Sgikp
         zYBrr4lSKG74IBGS0JH4NnLDnAu6457bCqxZGnP3L04KYCCRAnvnM7iR46kzLoOPKK/e
         e9ZJnZtbbRIPGHZPlwxZyX0OR3EKhVNd3Rz79Ih7JOk1XihDPjBhTjLZQpaaWLmXdOd+
         1HBydqI+xd4y3sqUXK8gbMRmjjGHuKQsqe0ZZPnKJt1fPHOHzlFLfn3ufU0RW1Zhduxf
         o8jo9rQ3+qM5VSpM1bOd9l0xqdcD9wC1fB2WfllFqlli75JEX/i3EAWji6AnnFEp2DZr
         E2Fw==
X-Gm-Message-State: AOAM531kLi3cEvOiWZ+QAuGEy8B+m22cSH8BxhpZvf0xFHW5Yg/niY1A
	otuSQ4xKQ6aa1ZhPhlxF/b8=
X-Google-Smtp-Source: ABdhPJz8hfgogAayHw7HZWMvEcBVvaI+9+Lyyn81eann3OdlIChYSmWCJv+OrbtB4J4bpIJdKs3Qjg==
X-Received: by 2002:a05:600c:9:: with SMTP id g9mr8564603wmc.134.1620372961805;
        Fri, 07 May 2021 00:36:01 -0700 (PDT)
Received: from agape ([5.171.80.53])
        by smtp.gmail.com with ESMTPSA id c5sm7561883wrs.73.2021.05.07.00.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 May 2021 00:36:01 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] staging: rtl8723bs: rtw_security.* clean up
Date: Fri,  7 May 2021 09:35:56 +0200
Message-Id: <cover.1620372584.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset remove some unused macros in include/rtw_security.h,
most of them tyed to old private AES encryption.

It also replaces private arc4 encryption implementation with
the in-kernel one.

NOT tested.

Fabio Aiuto (4):
  staging: rtl8723bs: remove unused macros, arrays and an inline
    function def
  staging: rtl8723bs: remove more unused encryption macros
  staging: rtl8723bs: remove unused symbolic constant _AES_IV_LEN_
  staging: rtl8723bs: replace private arc4 encryption with in-kernel one

 drivers/staging/rtl8723bs/core/rtw_security.c | 276 ++----------------
 .../staging/rtl8723bs/include/rtw_security.h  | 101 -------
 2 files changed, 21 insertions(+), 356 deletions(-)

-- 
2.20.1

