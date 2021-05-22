Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB932FAD
	for <linux-staging@lists.linux.dev>; Sat, 22 May 2021 09:20:32 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id d78so15863184pfd.10
        for <linux-staging@lists.linux.dev>; Sat, 22 May 2021 02:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nOv2WZcEnasfeaDEDQfGE1rOBmGTIP4Ftbjn/A5YKXY=;
        b=iBJp6TOm7ej0YRmC6vvdzugacEBVtU2vNnD+JIVZBmrlPtAuVZ3RQX2w2otf+mWDA1
         BGXuYFw0Tz4L8FCsxc+kxDr1nRJffzP+gvU6SVPgQep902HEAA0AIV3fwMwimKwE42e6
         q73e+IqsJX9uIkhnw7kJqjG391RZ6m0HoqS6sorlNRVRxs0ZI8fvNpSLkSZzl1h/JYhW
         I3s+P7w+z0tAe0MJEymj6a/iBMxq3eVg3GAkTXcbgbeWHeVhE+8ucETWeGubLC8LAHiB
         oOIfdb3+Nd+MZdKjHnrkEYKDc87R1AYeTLSbxs5RJfkrsPegck+2/VlaYkbp2vIe1F/V
         mRAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nOv2WZcEnasfeaDEDQfGE1rOBmGTIP4Ftbjn/A5YKXY=;
        b=VpjR6hHPUHEjLtP7ChzabcKGxoe/RoYil7vibGCaSP5pVtcW4AGkNt+lLpfJ1ikGf1
         5ROlMQhIBP+sS7wt45vNbhntLU6f7doVgkegzSV5y0Av9AbpMuNlRWoPaWevWSJ2mob7
         xsq765LLXjqIsYbpeLyrroz83nHyg34mFG6pPt0v45jvYgI32+Jl+TMrx7CF5xLg/q4v
         Mr1wqcqehy9JVQjjtlIeDR0Mq9TOTjKztR61Xn8zeFMzyp949FB2qK8P6DqZnh9l9WS8
         LGy/wwSuzvRmiMWNJ6Pj/Hn4vsThsRkhTDosxPcyj1EBuOuycpk4HAhCiQhTx2iqG8O0
         HpvA==
X-Gm-Message-State: AOAM5323Hp/ME5s1kyHYhdZ3Ef7RFOVl5JqwOoe/koeYi+oyb0paDv2H
	xFVds34nplWRlLp5L1/sVQ8=
X-Google-Smtp-Source: ABdhPJyaSGFX1We6YOP3L0kI9ML/rZmT+WvYiXHoYuIILi9hnDMa5hSLG7hAmqDQ1KggtN5I1RtX3A==
X-Received: by 2002:a63:af57:: with SMTP id s23mr3238856pgo.393.1621675231716;
        Sat, 22 May 2021 02:20:31 -0700 (PDT)
Received: from fedora.. ([2405:201:6000:a04d:2131:362f:d566:c9d5])
        by smtp.googlemail.com with ESMTPSA id gt23sm5925752pjb.13.2021.05.22.02.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 May 2021 02:20:31 -0700 (PDT)
From: Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>
To: gregkh@linuxfoundation.org,
	fabioaiuto83@gmail.com,
	ross.schm.dev@gmail.com,
	straube.linux@gmail.com
Cc: Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [Resend] [PATCH 0/2] [RFC] staging: rtl8723bs: refactor to reduce indents
Date: Sat, 22 May 2021 14:50:22 +0530
Message-Id: <20210522092024.65018-1-chouhan.shreyansh630@gmail.com>
X-Mailer: git-send-email 2.31.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

**RESENT THE PATCH BECAUSE I MESSED UP THE EMAIL ADDRESS FOR LKML IN THE
PREVIOUS MAIL. SORRY.**

This patch series tries to fix the following warnings by checkpatch.pl
in core/rtw_wlan_util.c:

WARNING: Too many leading tabs - consider code refactoring
#887: FILE: rtw_wlan_util.c:887:
+                                               if ((edca[j] >> 16) > (edca[i] >> 16))

WARNING: Too many leading tabs - consider code refactoring
#1529: FILE: rtw_wlan_util.c:1529:
+                                               if (pIE->data[5] & RT_HT_CAP_USE_92SE)

WARNING: Too many leading tabs - consider code refactoring
#1537: FILE: rtw_wlan_util.c:1537:
+                                               if (pIE->data[6] & RT_HT_CAP_USE_JAGUAR_BCUT)

WARNING: Too many leading tabs - consider code refactoring
#1540: FILE: rtw_wlan_util.c:1540:
+                                               if (pIE->data[6] & RT_HT_CAP_USE_JAGUAR_CCUT)

I wanted to ask for comments on the names of these functions and if such
a patch series would be acceptable.

The first patch refactors the code by introducing two new functions
sort_wmm_ac_params and get_realtek_assoc_AP_vender.

The second patch removes unnecessary braces from the conditional
statements in check_assoc_AP function.

Shreyansh Chouhan (2):
  staging: rtl8723bs: refactor to reduce indents
  staging: rtl8723bs: remove unnecessary braces from conditionals

 .../staging/rtl8723bs/core/rtw_wlan_util.c    | 141 +++++++++---------
 1 file changed, 72 insertions(+), 69 deletions(-)

-- 
2.31.1

