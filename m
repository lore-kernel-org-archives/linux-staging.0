Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A8F7F
	for <linux-staging@lists.linux.dev>; Tue,  2 Aug 2022 15:02:01 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id x1-20020a056830278100b00636774b0e54so438811otu.4
        for <linux-staging@lists.linux.dev>; Tue, 02 Aug 2022 08:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc;
        bh=uKqb6PaUkYrBfbM6a6MGXXS4D4m12oIAPT3k08dh9BE=;
        b=gXkIQzzfDTQXvsoALPrZvmxmyhBrvsTnC6vfXHPIWyycmy2E3UYVKtGGRIhanYf6II
         ckgNlh+mqhO9LRWE64p4t/YUUzwO4jGbEHV3233fDb06SktBOVbGM0wsfeC3cvx3yA5n
         k+xChpWg6vmjEq/7cXROWy7S84ZzYvkCRjtYPOkAkgN3vhckj06FVwd/Pp4EI82YZsj4
         iwjrvUJD1aEfVIxax9Leh0WegZQpE7Prie0dx1jyXF0I6G8zCs9lhr+djQ/VY/yduH2h
         0ktfHsjz0/2wF1s0UHhRZfFC5OA9eiEhMY2gpMvZMiE+mJZ6pNC+Frah1ncE94yunhzs
         BiOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc;
        bh=uKqb6PaUkYrBfbM6a6MGXXS4D4m12oIAPT3k08dh9BE=;
        b=b4mbDnyqd6+FEPzkA9vnYG/VDBEFdklTKKCsR21uP1kFXO2OY/Imfa+DssmxT5oDuu
         7AhGAwtyrM1UEff6YdcEXDgFHuAOyvHxE5CkD31dOw92e0CjnYthtRLNLyvFlJbrElTz
         rwW6UqiTYBaf9DiZlbUvt277kovAq4xAN6gaW4DGKPyMAOQBA5w3Bjc1+OLfbMCj2A3N
         PmAjdIOltQyEcjc9Nhn+SWdQdwbwXOCRDfIBilV912tjQY7REi0ApqTKVn8kbJi7kN5O
         AXm3TlcsEvPnCpe5p0YTne4eI5hgC8HQsc/8lcwVf97zRkvt2fxquNEG1CobinRrEsPs
         RM/g==
X-Gm-Message-State: AJIora+tbcuAIFMyIDVOvz33IGEwbW3CakmJ4F5o9ZMSJ4unlzR5zqft
	vFcAWbvv2CPs04vbfJ8SJvE=
X-Google-Smtp-Source: AGRyM1vrDpr5OKiG/q0avH8adnyXZc6OQGk+2OqxINidcJaLQRvnIJ0Ax6N8TMjuGWbtYgisTJLE4w==
X-Received: by 2002:a9d:784f:0:b0:61c:7817:3d8f with SMTP id c15-20020a9d784f000000b0061c78173d8fmr7707974otm.271.1659452519983;
        Tue, 02 Aug 2022 08:01:59 -0700 (PDT)
Received: from [192.168.1.108] ([216.130.59.33])
        by smtp.gmail.com with ESMTPSA id k22-20020a056870149600b0010e63d0afbbsm2473054oab.55.2022.08.02.08.01.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Aug 2022 08:01:59 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Message-ID: <c82114b6-1003-bfb5-0550-98dcbf1a3761@lwfinger.net>
Date: Tue, 2 Aug 2022 10:01:58 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: The r8188eu kernel module does not depend on the
 rtlwifi/rtl8188eufw.bin firmware file
Content-Language: en-US
To: Grzegorz Szymaszek <gszymaszek@short.pl>, Greg KH <greg@kroah.com>,
 Phillip Potter <phil@philpotter.co.uk>, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <YukkBu3TNODO3or9@nx64de-df6d00> <YukvnVWuhUeOgRyZ@kroah.com>
 <Yukx8KEEOhKTJ7HQ@nx64de-df6d00>
From: Larry Finger <Larry.Finger@lwfinger.net>
In-Reply-To: <Yukx8KEEOhKTJ7HQ@nx64de-df6d00>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/2/22 09:17, Grzegorz Szymaszek wrote:
> On Tue, Aug 02, 2022 at 04:07:25PM +0200, Greg KH wrote:
>> Looks like someone needs to add a line to the driver that looks like:
>> 	MODULE_FIRMWARE("rtlwifi/rtl8188eufw.bin");
>> […] Can you make a patch that does this?
> 
> Sure, I will prepare and send one later (hopefully today), assuming no
> one objects in the meantime. Thanks for quick response.

There will be no objections. All 8188eu-based devices need that firmware. 
Omitting the MODULE_FIRMWARE macro was simply an oversight.

Larry

