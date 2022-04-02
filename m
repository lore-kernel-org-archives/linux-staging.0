Received: from mail-oa1-f65.google.com (mail-oa1-f65.google.com [209.85.160.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572D51363;
	Sat,  2 Apr 2022 08:51:18 +0000 (UTC)
Received: by mail-oa1-f65.google.com with SMTP id 586e51a60fabf-d6ca46da48so5136964fac.12;
        Sat, 02 Apr 2022 01:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vf9XrnRNNEu/g7WX3Cp+ZJwmHe6lW1eduApC7K6BbhE=;
        b=j4xXeAsTbXwdT377xyxJfFrgd59iWXp7ELSyJv/EanKnQ6DUqM7TKGIHzdUAJwBhho
         IfP92/Mu4xkb7coNtVbXepdb/BDiVtnO/ri84k0s5IenWecqphAeZiDhCpKLiikTU+Le
         iJxeo8FeZ5r55plXaqBWsRyfw9tioVsq2pyYtxMggElcaVnSqMJ4rjjgn1lnJ2bmnACv
         m6HfGppRv2L5jJYOFopWEj9iTHX1qjv1kHfy3BOqaZg1vPUL6Vwx7TQ48KeRQfZmrEc9
         8p8IPjIaOIflSh+Klx1YPKYCicJ4SqF7Ep6mWy6uzd/Tur6gHbU4eZjvbZwcukbbeZBb
         t+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vf9XrnRNNEu/g7WX3Cp+ZJwmHe6lW1eduApC7K6BbhE=;
        b=VY+TPtzD9XJ45nQFPcSd9HA6HViPdUH7vA7C3utiVX/yKSwF3U3TLgrKF9K4wID+X0
         MKN/qYEWAs4skHGdahauj70jGjaLu/u834UAd9JHInY+P5Qz1nJ/9TMHsXt6DF0+Ef2M
         eZASY3G8JymZyaJtq3ssU74M/xaWwZTKEQ1MlB4CmSKb89y6bNn7oMDIkM5gHeMnete9
         WNcgpbWY/NxWqF/h+7U2PYNFBZY8qdjY+Kc0RsIXELQ7TLrect76JpnO4Lh7sfUbAc2h
         FuBGgUApi3FrjdXu3hEYRYL2Lf3cjrtigEd/6ea+vSI28iNmADWxZ1fONUVRXzufbsZt
         p03w==
X-Gm-Message-State: AOAM531FkbgWKH0TxRNc8JNJ0GBveVmLUXkRQEXdpB2oVGk+8BF6J7AU
	bxjZWLZKKdBTpmlTG87BdqE=
X-Google-Smtp-Source: ABdhPJz0isEyVWmgEv8MhEfi7jtm1pbgdsRBYf6wjvSELYX1zdlwt+fTQ0mw2iorYuRZP969f1KQXw==
X-Received: by 2002:a05:6871:787:b0:df:f1a:2d9c with SMTP id o7-20020a056871078700b000df0f1a2d9cmr6599085oap.1.1648889477542;
        Sat, 02 Apr 2022 01:51:17 -0700 (PDT)
Received: from bertie (072-190-140-117.res.spectrum.com. [72.190.140.117])
        by smtp.gmail.com with ESMTPSA id bg39-20020a056820082700b00324c8eba341sm2074930oob.18.2022.04.02.01.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 01:51:17 -0700 (PDT)
From: Rebecca Mckeever <remckee0@gmail.com>
To: outreachy@lists.linux.dev
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rebecca Mckeever <remckee0@gmail.com>
Subject: [PATCH 3/6] staging: r8188eu: correct misspelling in comment "conider" -> "consider"
Date: Sat,  2 Apr 2022 03:50:45 -0500
Message-Id: <5799315f84e50db2a7d05b74cd4ed9ec2f28a8e2.1648888461.git.remckee0@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1648888461.git.remckee0@gmail.com>
References: <cover.1648888461.git.remckee0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct spelling typo. Reported by checkpatch:

CHECK: 'conider' may be misspelled - perhaps 'consider'?

Signed-off-by: Rebecca Mckeever <remckee0@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index 09fde5b23ce2..2e135bbd836a 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -293,7 +293,7 @@ int rtw_cmd_thread(void *context)
 				rtw_free_cmd_obj(pcmd);
 			else
 				/* todo: !!! fill rsp_buf to pcmd->rsp if (pcmd->rsp!= NULL) */
-				pcmd_callback(pcmd->padapter, pcmd);/* need conider that free cmd_obj in rtw_cmd_callback */
+				pcmd_callback(pcmd->padapter, pcmd);/* need consider that free cmd_obj in rtw_cmd_callback */
 		} else {
 			rtw_free_cmd_obj(pcmd);
 		}
-- 
2.32.0

