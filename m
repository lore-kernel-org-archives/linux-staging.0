Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4B52F2B
	for <linux-staging@lists.linux.dev>; Tue,  8 Mar 2022 20:56:31 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id c16-20020a17090aa61000b001befad2bfaaso457037pjq.1
        for <linux-staging@lists.linux.dev>; Tue, 08 Mar 2022 12:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bF1HEb4hQ/k+ib8dpChTtvtb+CH2Jji8DmJRbjZMzTw=;
        b=BpOabioy+Xmzf6o470njed3G6kgCN7E2fzRVoYriSX6cGI/piyAKvdvCX0HLbQcclg
         qKljPt14k41dZ+/5mLjXQnUY/+3At32L0Gq9yfmJNGllOI68E98fin7+SGsh9hbylhWh
         rGyl3I1nn2R2rvgCxM+IP0TmGtnMogTHS7u/BpPK/DeWqDYiSPq6I+YeYRWb0Iszcr8t
         xL5+M6TO80ChYg1jzceBnzKS7a2AhOEiikVW7jGoNXqMVuWmnzheeouE2l8iqq93hwdJ
         jJc5ISRbF0erRR6TRiL6D/DnRJszs64o7PSzIWdaBUUhA2b1SDzpKztWOzExpEmJJAdS
         o3JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bF1HEb4hQ/k+ib8dpChTtvtb+CH2Jji8DmJRbjZMzTw=;
        b=eq/xblniWJtWhVrIjSutM0Cei9bE8ToghE73SUXJ6W4YFLyhUQYUR4qr9M/9zVDDvM
         AGPcoG2VUYAcivbiy6Up5FoCEz4PxamWkMznO8BXQd39r/NcCCgAHQIsbUBrv4wFPnRt
         eUAkiHeDIr3sX/KOSxZvWi2RT8JZGHKQ8fJS2neQi2sMZyz/Ye/YWfbjoDR++Lsv7rqh
         F19nE4U1sFTmLxhbqbE/eOoW//8zUBwk0UU59RKyYwcp7doNUrRsxS3eQLcNl0sBrh55
         eWInK9Mb7ogTVw22zd8qW6ZL+RM1AS6os+zkcL9/EnEhiavlEweCVVpjEMqJWP/eFVSB
         875g==
X-Gm-Message-State: AOAM530x+KerBamJbFeRsFwMK58B8JJMO6qPRddM4BMkW06wss6E4nA+
	rShqMxF84HeRI006z2V1kkY=
X-Google-Smtp-Source: ABdhPJyYCSMFRB25ISa8tma4k+MrwF+TJGeCpy8kkKm47LntfvId+7RmCBY4yiOLpOU9xFOXhrNzig==
X-Received: by 2002:a17:902:8a97:b0:14a:c625:eb2d with SMTP id p23-20020a1709028a9700b0014ac625eb2dmr19419454plo.26.1646772991323;
        Tue, 08 Mar 2022 12:56:31 -0800 (PST)
Received: from localhost.localdomain ([103.85.9.4])
        by smtp.gmail.com with ESMTPSA id u10-20020a056a00124a00b004f741eb11d0sm1252661pfi.149.2022.03.08.12.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 12:56:30 -0800 (PST)
From: Vihas Makwana <makvihas@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Pavel Skripkin <paskripkin@gmail.com>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vihas Makwana <makvihas@gmail.com>
Subject: [PATCH 0/2] staging: r8188eu: improve error handling
Date: Wed,  9 Mar 2022 02:25:08 +0530
Message-Id: <20220308205510.48431-1-makvihas@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset improves error handling in rtw_init_drv_sw() and
fixes some memory leaks.

Vihas Makwana (2):
  staging: r8188eu: call rtl8188eu_free_recv_priv from
    _rtw_free_recv_priv
  staging: r8188eu: proper error handling in rtw_init_drv_sw

 drivers/staging/r8188eu/core/rtw_recv.c   |  1 +
 drivers/staging/r8188eu/os_dep/os_intfs.c | 60 ++++++++++++++++++-----
 2 files changed, 48 insertions(+), 13 deletions(-)

-- 
2.30.2

