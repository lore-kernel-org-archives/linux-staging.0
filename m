Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF732F29
	for <linux-staging@lists.linux.dev>; Thu, 19 Jan 2023 23:31:29 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id f25-20020a1c6a19000000b003da221fbf48so2496319wmc.1
        for <linux-staging@lists.linux.dev>; Thu, 19 Jan 2023 15:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ezoMouCrKxN4+hC09aQCsVRt36siV05JqIOGZbWNQRU=;
        b=btGyoBdXiWG3DqyDFEK9RVcWkizaGuwvn2PeDbboPaiGF862dbDGbjXNrwisNX/zx/
         YAInkdd9Agq9+8/Nr/9y8UO9XEan73Z1D3PCuxGtf3hG9xCLA6lVTk6GphGd3FO7MreW
         b0m5Cy4vyXF81ug+d1guxip6Ci4Z0k7yji9kXHUuU+ELHcbyHB6ScUTUUm7Dt073a3u2
         T8yJK1mY2NWWE3muTnEBhSGBoqAnHyG1eimDuo7POyGF9LXM3kiaVKZwZpEY7YbIVXDj
         ZfZl/Ux/lKumKuU7IL8XmDI9P2JC9tJ5BqI6bfdbFlSdqmmPoS+VI/07M5vREPIDp7I5
         oElA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ezoMouCrKxN4+hC09aQCsVRt36siV05JqIOGZbWNQRU=;
        b=lB1vzl94LDuipMEFXhZfwG9wrq0op8UC/DuVAplsyoRszFzo2gNGh7gAjDEGgminDJ
         8c77X6v3IlyzJiV2WBMifXCWr9LEWDq03ofMypogZipKDyu+Nobn37MTifJg2qj9u30w
         OCaIEKLsRlKvFCIZLb3GDAh8EfjuP+ta6RCl9H7H2RHoyAHGagiCELICmyCrfN7zG7gR
         xDYh25YvSgeFN/Hpy0B14rC2Jf9gIvFbiGcFz3oItDNd/tGroDrArtUCAp4ovmAhcIpH
         +SP/c2e+TLDEjYPnymA9OcrwgsHrCTk+dWB+e9IX1BEKGRMkO06oXbuBSCDpVdbh27Nn
         M52Q==
X-Gm-Message-State: AFqh2ko4VBL1SajNNUByvB7Obq8HGhyNb4Okie1qVIRwGrtNOKd36Hk9
	YAj/YnrC/qowRgy8sNGHRXg=
X-Google-Smtp-Source: AMrXdXvyKpwLXDKTyfszH3LHONdiwNNvToDyaMbTuv9Fr0BtB+sDZhcPzM1bniwh2nat6fDBbeiZlQ==
X-Received: by 2002:a05:600c:3b29:b0:3da:f7a9:50ca with SMTP id m41-20020a05600c3b2900b003daf7a950camr3128955wms.0.1674171088155;
        Thu, 19 Jan 2023 15:31:28 -0800 (PST)
Received: from [192.168.1.100] (p57935ca5.dip0.t-ipconnect.de. [87.147.92.165])
        by smtp.gmail.com with ESMTPSA id f18-20020a7bcd12000000b003db0659c454sm598599wmj.32.2023.01.19.15.31.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 15:31:27 -0800 (PST)
Message-ID: <750e22fd-ff90-0005-ce14-85c55824b261@gmail.com>
Date: Fri, 20 Jan 2023 00:31:25 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] staging: r8188eu: Fix some endian problems
To: Larry Finger <Larry.Finger@lwfinger.net>, gregkh@linuxfoundation.org
Cc: phil@philpotter.co.uk, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
 Gaurav Pathak <gauravpathak129@gmail.com>
References: <20230119191219.12080-1-Larry.Finger@lwfinger.net>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20230119191219.12080-1-Larry.Finger@lwfinger.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/19/23 20:12, Larry Finger wrote:
> Sparse lists the following warnings:
> 
>    CHECK   drivers/staging/r8188eu/core/rtw_mlme.c
> drivers/staging/r8188eu/core/rtw_mlme.c:1197:49: warning: incorrect type in
> 					 argument 2 (different base types)
> drivers/staging/r8188eu/core/rtw_mlme.c:1197:49:    expected restricted
> 					 __le16 [usertype] mstatus_rpt
> drivers/staging/r8188eu/core/rtw_mlme.c:1197:49:    got unsigned short
> 					 [assigned] [usertype] media_status_rpt
> drivers/staging/r8188eu/core/rtw_mlme.c:1275:57: warning: incorrect type in
> 					 argument 2 (different base types)
> drivers/staging/r8188eu/core/rtw_mlme.c:1275:57:    expected restricted
> 					 __le16 [usertype] mstatus_rpt
> drivers/staging/r8188eu/core/rtw_mlme.c:1275:57:    got unsigned short
> 					 [assigned] [usertype] media_status
>    CHECK   drivers/staging/r8188eu/core/rtw_mlme_ext.c
> drivers/staging/r8188eu/core/rtw_mlme_ext.c:6842:58: warning: incorrect type
> 					 in argument 2 (different base types)
> drivers/staging/r8188eu/core/rtw_mlme_ext.c:6842:58:    expected restricted
> 					 __le16 [usertype] mstatus_rpt
> drivers/staging/r8188eu/core/rtw_mlme_ext.c:6842:58:    got unsigned short
> 					 [assigned] [usertype] media_status
> 
> The second argument of rtl8188e_set_FwMediaStatus_cmd() needs to be in CPU
> order, not little-endian; however, when it uses that value to call
> FillH2CCmd_88E() the parameter must be in little-endian order as that
> value will be sent to the firmware. Note that the conversion from LE to CPU
> order was le16_to_cpu() rather than the correct cpu_to_le16.
> 
> The definition of FillH2CCmd_88E() is revised, and the proper conversion
> routine is used.
> 
> Note that the original code performed one byte swap on the secong argument
> of FillH2CCmd_88E(), and got the correct answer even though the semantics
> were very wrong.
> 
> Signed-off-by: Larry Finger<Larry.Finger@lwfinger.net>
> Reportewd-by: Gaurav Pathak<gauravpathak129@gmail.com>


Checkpatch does not like the "w" in "Reportewd-by:".

Tested on x86_64
Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150



