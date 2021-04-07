Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F576D11
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 13:49:55 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id b133-20020a1c678b0000b02901231346381dso1209017wmc.0
        for <linux-staging@lists.linux.dev>; Wed, 07 Apr 2021 06:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dkjimhjDd9u/y2YdPJ4t6EDrMe97yh+nEoGhNNKYzQA=;
        b=dYwi0ietfEob54IKIQye9xDmJmJNeltd1q1eFzgnbXjCf4xQ02Z/71Z917OvAiF1RX
         m2W+ZD4Cy6ZVNTpfUkEXEG7XE1wp/xEPtnfH1QX70n/MMfS52JtCzDnyWVnayvMUTtjQ
         DNnoWwSvkdpirBNHdOUv0X1ObSgCtKO1E6R+j9KhGAap1Tej+hOmYKkyU3qUGcsupsj2
         ROCR0aIKG9X1p9Kl3fNCa1JaSUXQcplNsuQoGzvfSw+g324d8aaggeUapi+pjGCguO5L
         oEMgBLWAwBjPd8bKizNjj2KnPAmarmwrS8QSOtEDeLtO2Z//eHInLHPHBOxk1TFCdnLt
         ww7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dkjimhjDd9u/y2YdPJ4t6EDrMe97yh+nEoGhNNKYzQA=;
        b=H/PCxi6s35QegYX3CXdxxom7M8WngYgGgNS5RQ87+ulgQKpLdL7okP/aTBMIRJsbCz
         YMDw5iWSL7azoirWDyxaJbp2R0WdYJfy0V+eqTc1AYRpIvIf0Kb62l9qSFoQpWWgtNmB
         IADXhwp07SNziy9zMjrJ4vGIaoZsdNE2yHFZUx7m8aT/FohLSYD/KgYRdvy/k2msRB8t
         u8VvffcsTf1ViJja4ynrOVjchOCumfjUCCq5YVSb2VHcCG4GAlj9YyBitk2QCPuTzUQF
         rus5+co5wx1Ik+5Lxl1+AMMduaxZkTzVpys+aWlRIre1B5oUe7Tc9MVXieoxwvue3y5Z
         70ng==
X-Gm-Message-State: AOAM532W/eZlBMN8L4/X73c0c+89kiPXBgazasJRFAE6s7FEdg1ErKM9
	uHZc6yk6o4tGhwOV9cSUC4M=
X-Google-Smtp-Source: ABdhPJyL7+Lls+1JEjbmaOvWqid65ZWj3PZdWaCDPEp+d1ON4mSbDq+YNB48fRvaDJzGcoKXC03oNw==
X-Received: by 2002:a05:600c:4103:: with SMTP id j3mr3168538wmi.175.1617803394209;
        Wed, 07 Apr 2021 06:49:54 -0700 (PDT)
Received: from agape ([5.171.81.68])
        by smtp.gmail.com with ESMTPSA id o14sm31915253wrh.88.2021.04.07.06.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 06:49:53 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 01/19] staging: rtl8723bs: remove DBG_871X log argument
Date: Wed,  7 Apr 2021 15:49:25 +0200
Message-Id: <3473925ae9ee5a3bcd0ab86613dbce80b6d3f33f.1617802415.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617802415.git.fabioaiuto83@gmail.com>
References: <cover.1617802415.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch prepares the application of the semantic
patch aimed to remove all DBG_871X logs.

One occurrence of the DBG_871X macro has one
repeated argument, that's not even comma separated
value with the previous one nor a format string
parameter associated.

In normal conditions this worked, for the macro
is usually not expanded (the do nothing behaviour),
but if I try to apply the sempantic patch to remove
all macro occurrences, all macros call after that
abnormal declaration are left untouched (not removed).

Remove all of the DBG_871X logs as they currently
do nothing as they require the code to be modified by
hand in order to be turned on. This obviously has not happened
since the code was merged, so just remove them as they are unused.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index eac663119290..f18a7afcc0d3 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -823,7 +823,7 @@ static signed int ap2sta_data_frame(struct adapter *adapter, union recv_frame *p
 			#ifdef DBG_RX_DROP_FRAME
 			DBG_871X("DBG_RX_DROP_FRAME %s BSSID =%pM, mybssid =%pM\n",
 				__func__, MAC_ARG(pattrib->bssid), MAC_ARG(mybssid));
-			DBG_871X("this adapter = %d, buddy adapter = %d\n", adapter->adapter_type, adapter->pbuddystruct adapter->adapter_type);
+			DBG_871X("this adapter = %d, buddy adapter = %d\n", adapter->adapter_type, adapter->pbuddystruct);
 			#endif
 
 			if (!bmcast) {
-- 
2.20.1

