Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50F85F
	for <linux-staging@lists.linux.dev>; Sat, 27 Mar 2021 00:18:18 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id l13so5490210qtu.9
        for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 17:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oOfclmJ04utnxnAEDLzlsT6/2w4ISJ9SBiqT5WMFbMQ=;
        b=K9U4X8jZIqT3ISqwQL2mAdpTIRVJwoRhUzicqqHpXvV7q38xsNqMtuXQf+q9pJbFzf
         kCpHQBKezg+8ihMUJYiEU/fF/3vEM87VQtxDb758qL/rIh9zQBN5RAG19u0xtYL/GuBA
         rSggdvjW5qmlyCft3+ro9AcvmKp2PlphGP0o5guRkDtEo4qOvE8UdQAXoXKT+4Qtqm1Q
         EvqUrPxI4/VxcSCW5h2vBPHCh5FpJZ1mLO17cpQkw3HnT9k4pSJAHv65P7xhCUfgfg/C
         QQAHrEOClAx4fGEG2XDGSyqeFGKubKOFruPxEAbOdvPsPkOA25wmCj80UVoMEbLBTXWx
         QeKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oOfclmJ04utnxnAEDLzlsT6/2w4ISJ9SBiqT5WMFbMQ=;
        b=Fk3oG4RtDXi19KGuTd2va5L0q/is8rMUDmioK1/UJ0OXCG/Vb4Qv7+sqprpqJzdoYo
         C92kC37KZ/vh/RNbodj8aDOVN+4ZWUKNPnl9m5DN97vMTbcEncNR57gXHuFKQP0lwv/P
         01bPVDs//UfhCkOgqI7r7TsawST8rptX/v3DIy4Zmk0ZQi4YvY15IkVpNShVB9Nx66cZ
         UiTfP7A2SQ4he31eUze5QXTtXnSuukpi4fap6Gq8WcbYdfnsztBX54YBv3bP8gJY1RUc
         z+m0xxqYMQD38VlOOb5VHDRtbW74ThVPWlv8J3AiwXkLd1POHE+KD4TnnVSrk4fYlYhE
         zulg==
X-Gm-Message-State: AOAM533+Zh4X56d8oBGo041adCbZtGhmRU1nJyD/umRMIQm4T11rEdUT
	8M48Pvm+8k4XOVCGRZNw9D8=
X-Google-Smtp-Source: ABdhPJz8CatQNMODgkupr+pq1Mx0fTxyel1teV/rtDdcSO5hFQzFiEz4AS6PkNiltW8E/wKt1FQfAQ==
X-Received: by 2002:ac8:7747:: with SMTP id g7mr14315512qtu.144.1616804297826;
        Fri, 26 Mar 2021 17:18:17 -0700 (PDT)
Received: from linuxerio.localdomain ([186.32.194.42])
        by smtp.gmail.com with ESMTPSA id z2sm8213531qkg.22.2021.03.26.17.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 17:18:17 -0700 (PDT)
From: Edmundo Carmona Antoranz <eantoranz@gmail.com>
To: gregkh@linuxfoundation.org,
	marcocesati@gmail.com,
	dan.carpenter@oracle.com,
	ross.schm.dev@gmail.com,
	fabioaiuto83@gmail.com,
	linux-staging@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	Edmundo Carmona Antoranz <eantoranz@gmail.com>
Subject: [PATCH -next 6/6] staging: rtl8723bs: sta_mgt: return _FAIL if there is an error
Date: Fri, 26 Mar 2021 18:17:36 -0600
Message-Id: <20210327001736.180881-6-eantoranz@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210327001736.180881-1-eantoranz@gmail.com>
References: <20210327001736.180881-1-eantoranz@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If there is an error when calling rtw_init_bcmc_stainfo() inside
rtw_init_bcmc_stainfo(), variable res is set to _FAIL. However, when
returning, _SUCCESS is always returned regardless. Just in case,
all existing calls do not consider the result of the function.

Compile-tested as I don't have the hardware.

Removing this warning:

drivers/staging/rtl8723bs/core/rtw_sta_mgt.c:536:6: warning: variable ‘res’ set but not used [-Wunused-but-set-variable]

Signed-off-by: Edmundo Carmona Antoranz <eantoranz@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
index f96dd0b40e04..7b578192adf5 100644
--- a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
+++ b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
@@ -551,7 +551,7 @@ u32 rtw_init_bcmc_stainfo(struct adapter *padapter)
 	psta->mac_id = 1;
 
 exit:
-	return _SUCCESS;
+	return res;
 }
 
 struct sta_info *rtw_get_bcmc_stainfo(struct adapter *padapter)
-- 
2.30.2

