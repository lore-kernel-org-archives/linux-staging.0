Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com [209.85.210.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DAFC17FB;
	Wed,  6 Apr 2022 08:31:26 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id n19-20020a9d7113000000b005cd9cff76c3so1283192otj.1;
        Wed, 06 Apr 2022 01:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e2nIgPNh3LZLtjXU7XO/QsmWtjivZoy3EzJLLI+3/RM=;
        b=GzXIj9P51h2wKssIFpZU6VktIrPFOKUFfby38bTBRySx0eRoIGPrId2GUiPWIiEMeE
         OJ8yJvfDsmS5BptMR5Wz0Pfxau9wqrCmZYiyCL/SlO23cyUgvuUhwjidVX2qNpuKaA90
         QkHPW2Rjp/8+w0S2n57adAl23CQ2GnQss6q1lUDOeKdOZ5wb3+n2hppUtC5oDWFB0vsa
         VPcQvsdb1KIf0iLdiEZn2cToz2bXUHhS9D+gpExEoCTRK8xqCJVZB2cc+/Zi9XYAQixJ
         9EA/xE17zxKmzq04uPrLWE8l27kHJ+VsaBMtlCqCvEVheqeremAYugdoaq0+DKnin3gt
         uvFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e2nIgPNh3LZLtjXU7XO/QsmWtjivZoy3EzJLLI+3/RM=;
        b=4kIVotYhkWWA2XPzhCTR8AgjUq+RF4mIDiHRdE/OIqaUGt10/tZsnkSpfTmK6xkkb9
         yh8vn1+nK3SzsEQH/7TO6cxX5HIlWT0hXqchwHHRRbQMyT+epKAAZp2sVtwKV55tD8/V
         1xYXCBR4yPjtizGWBEUCq6tmMZoTr8dRMHilFw5+gVpPJBzXYgiyS/6fB7sNCrgUOjZ3
         8IX3adkjn+84Eveu0Fb5VFCrK/6B3h4+0ozONDWNrsAlHMYP5MnugnV3q9m3W+KK+3WO
         naBsVfAwZld8vv5v8OzgGzsvobKycwk3BUu7lcZ39jxAIfSrSvkD4+SLGdf845fFGiEE
         CNGA==
X-Gm-Message-State: AOAM531npp0j+EHkCm3bljf/KXqnDG6pVk5ksV9Z/vV6h532E4Ga1zcA
	YEr2rX7HdpDXfdsA/Ln9lpk=
X-Google-Smtp-Source: ABdhPJzHhSgEnNlc69E9Z7Tfy3nTedvFPS05swID/wqc4IRETGcRigFh2BUGlaUy0LCA0mCqbdVKDA==
X-Received: by 2002:a05:6830:201a:b0:5e6:8de6:9922 with SMTP id e26-20020a056830201a00b005e68de69922mr2543389otp.3.1649233885645;
        Wed, 06 Apr 2022 01:31:25 -0700 (PDT)
Received: from bertie ([172.58.102.145])
        by smtp.gmail.com with ESMTPSA id u22-20020a4ae696000000b0032158ab4ce9sm5877502oot.26.2022.04.06.01.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Apr 2022 01:31:25 -0700 (PDT)
From: Rebecca Mckeever <remckee0@gmail.com>
To: outreachy@lists.linux.dev
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rebecca Mckeever <remckee0@gmail.com>,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH 3/4] staging: r8188eu: correct misspelling in comment 'tppe' -> 'type'
Date: Wed,  6 Apr 2022 03:30:59 -0500
Message-Id: <edaab7d38893e4f1cbb3c281b617c74fa91f0fe7.1649233201.git.remckee0@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1649233201.git.remckee0@gmail.com>
References: <cover.1649233201.git.remckee0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct spelling typo.

Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Rebecca Mckeever <remckee0@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index cd20811ae152..f4a277e6b654 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -1162,7 +1162,7 @@ u8 p2p_protocol_wk_cmd(struct adapter *padapter, int intCmdType)
 	}
 
 	pdrvextra_cmd_parm->ec_id = P2P_PROTO_WK_CID;
-	pdrvextra_cmd_parm->type_size = intCmdType;	/*	As the command tppe. */
+	pdrvextra_cmd_parm->type_size = intCmdType;	/*	As the command type. */
 	pdrvextra_cmd_parm->pbuf = NULL;		/*	Must be NULL here */
 
 	init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, GEN_CMD_CODE(_Set_Drv_Extra));
-- 
2.32.0

