Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF561374;
	Tue, 19 Apr 2022 18:19:57 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id d9so13825553qvm.4;
        Tue, 19 Apr 2022 11:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tyQuLgB/CsR0aLvsOUcIg9iM46ZFr1ZTjXluFgbi8lw=;
        b=B20wYfz4Hb1BxrL/fu4aESxQ/t/xR+m+o443keOeSDnjV4EYZheiiNJhYlrKqhzE/w
         MvOWfD9K/i6kV7XDjTOT+BDRT9FTmdkB8a/fiYAky8GYsMX7BOMr4NAYJSyNV3EDwPg/
         fveSD6KO/2zu7LGV4GZ6+5fNYMb/co3/HUn4xN7ng8vai1aNRx24VJcwcYzrkfzheG30
         1/dq9xMW3haQNinqSuGFm3+RlkSckt6Cgbk9rPUssKpnzgP73OEcFggPpQ7vo/OmYATc
         lXjgc284WdMf72s9QxrY/OQvy1L3DAskNf/2YEgLsQuA7QFapsbjkbBmBXPYCZdJ9cts
         2kag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tyQuLgB/CsR0aLvsOUcIg9iM46ZFr1ZTjXluFgbi8lw=;
        b=nx0KzgpWlb8zOXq/rf3LS8c0whDLGIXNV05u/HWu7q4yRIwo7hFY9Ee2dZXYCpaOid
         ItCznInxkLy5ISnmMtVXwPzSeszRbBY0GmdavWEEx0VCgtxwi9bipszV2GN3vcmFghFd
         dt2KnWTNggYXXhO1B7umaMG7r77VDaA1csMhIEcacaFQ0A8E8XUHVnEjGoXfvUQnZ+mm
         oTKMPOt8Bc/Iu19HVtPsJu60/cl6Am7KwufLFzMSUfQWNFEuQ9YMTuo3WJFmNHnuoJRA
         Lg3XKzuNrX1W7T9+cD5u9Al4F/C1FObDkEg83V3NyrGMsUhd5fb8KpKOaVpljz1UMiC+
         oAHA==
X-Gm-Message-State: AOAM533xhcVFnDOlBNnAeLr7VvYkgy4KXxedk4t9jklCWc6W0XbkUYuW
	vLxSaOe2YmNSzv6NMgP0nVMD1C9uFRzowCZR
X-Google-Smtp-Source: ABdhPJxGveIMiH2/+BpxOK75542t0CmkWxPvzYE3z6vxlXQaMUeiB4aOiBvi3H8WlyWRA3nMyPSdMA==
X-Received: by 2002:a05:6214:29eb:b0:446:5742:1748 with SMTP id jv11-20020a05621429eb00b0044657421748mr8864930qvb.24.1650392396067;
        Tue, 19 Apr 2022 11:19:56 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme.wework.com ([4.34.18.218])
        by smtp.gmail.com with ESMTPSA id e126-20020a376984000000b0069c86b28524sm373334qkc.19.2022.04.19.11.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 11:19:55 -0700 (PDT)
From: Jaehee Park <jhpark1013@gmail.com>
To: Larry.Finger@lwfinger.net
Cc: phil@philpotter.co.uk,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	jhpark1013@gmail.com,
	Pavel Skripkin <paskripkin@gmail.com>
Subject: [PATCH v3 7/7] staging: r8188eu: remove unused else condition
Date: Tue, 19 Apr 2022 14:19:38 -0400
Message-Id: <abbd003237836f098b4360e8208bc463cd758aff.1650392020.git.jhpark1013@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650392020.git.jhpark1013@gmail.com>
References: <cover.1650392020.git.jhpark1013@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

s_ret cannot return '2' so this else condition is unused. Remove this
unnecessary else statement.

Suggested-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Jaehee Park <jhpark1013@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index 5ada336ac723..e60e1903950f 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -705,9 +705,6 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 			s_ret = rtw_select_and_join_from_scanned_queue(pmlmepriv);
 			if (s_ret == _SUCCESS) {
 				_set_timer(&pmlmepriv->assoc_timer, MAX_JOIN_TIMEOUT);
-			} else if (s_ret == 2) { /* there is no need to wait for join */
-				_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
-				rtw_indicate_connect(adapter);
 			} else {
 				if (rtw_to_roaming(adapter) != 0) {
 					if (--pmlmepriv->to_roaming == 0 ||
-- 
2.25.1

