Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E163FC3
	for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 13:31:51 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id b21-20020a1c8015000000b003049690d882so12030559wmd.5
        for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 06:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=btttk93aUSoAIGuvA0mTkUBQEce9Eyd/W3I2VtkIz5w=;
        b=Xhl6QYeEWdrSrlNtd2m8HCfgmI7HSzhbg3rAvOI+cTykhjCqUaR6TRMvnN0e1F5YEy
         dlUa99GeTEiwnz/CW/SLZ8315ZcwZOZIZDOz16YqYCnjgcI655mBl22FIPqKh/QezEZF
         4IFaeDTsGJwtAvPiVgvbkUIgzr6vgk8K8iukxvl1htLUKeAF1NITk65TkHhTO9KVESdr
         NNYQEMK7pSytNsYL5jVvUHXY3Q9ZdFTT6iBoYGEFIkY7w6cVEWF49cZCJ3l86666pren
         40j76a6aGqeltIOwACZmjWGOSM4vFD4+KjYwAj+zd3ZG24u9WSi5M9ASgtiSCt4q6y4s
         Ga9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:from:subject:content-transfer-encoding;
        bh=btttk93aUSoAIGuvA0mTkUBQEce9Eyd/W3I2VtkIz5w=;
        b=6+VjJKVoW4/HE4ShkXjR2rs56rb4S/MX5SmhHEiNvNn677ff0aWV+DlfmrL4UmJXpa
         rm2wI6wHs9hmYmzDNQXuXTbQdnYNnpGEzvxJbG8G0agOD0e4JOVAA54Hxtoxg/Dc+gkS
         eZKToiiL2Xrh+U7RMCSBoviaRvaYUr6TvuiqQZDfcQDyQruAJ/G30EuSvbVNQFDuup6g
         zks9un3GCuBEj/7JvtJNkJqMZ5z6xZdAC/wXe+5sWPHBGTTZSm2V2sJGZ6Hwmyh2683W
         0ccMukwFdAfGK9zA4CRzv2s+a794fhbcUUVtVbHMwBBR/lEKGew3lwaGGjYrJJWUnviM
         Gi9w==
X-Gm-Message-State: AOAM531Lpeqir5aT6/nBTXdTkhV6OGy7krzkny8gzZt+2l1cCIqsMS/j
	s03wOZYhJoSX7K2JjcQiJeI=
X-Google-Smtp-Source: ABdhPJzW5QuBHT1//iBN/LEipFfEVSJ3k8S4oCN2WTOnucZO6OPPwus7sCOefy0VdP7e1altBeEMDA==
X-Received: by 2002:a1c:3845:: with SMTP id f66mr15396060wma.63.1631971910196;
        Sat, 18 Sep 2021 06:31:50 -0700 (PDT)
Received: from ?IPV6:2a02:8108:96c0:3b88::cde? ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id l124sm13781028wml.8.2021.09.18.06.31.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Sep 2021 06:31:49 -0700 (PDT)
Message-ID: <7f1c135a-d85d-d271-f315-d665a5fe1472@gmail.com>
Date: Sat, 18 Sep 2021 15:31:48 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-US
To: Larry.Finger@lwfinger.net, Phillip Potter <phil@philpotter.co.uk>
Cc: Greg KH <gregkh@linuxfoundation.org>,
 "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
From: Michael Straube <straube.linux@gmail.com>
Subject: staging: r8188eu: Can odm_DynamicTxPowerNIC() be removed?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Larry, Phillip and all.

While removing code that checks for the chip type I stumbled upon this:


void odm_DynamicTxPowerNIC(struct odm_dm_struct *pDM_Odm)
{
	if (!(pDM_Odm->SupportAbility & ODM_BB_DYNAMIC_TXPWR))
		return;

	if (pDM_Odm->SupportICType == ODM_RTL8188E) {
		/*  ??? */
		/*  This part need to be redefined. */
	}
}


(pDM_Odm->SupportICType == ODM_RTL8188E) is always true in this driver.
Currently the function does nothing and the driver seems to work fine.
Because of the comment I'm not sure if the whole function can just be
removed?

Regards,
Michael
