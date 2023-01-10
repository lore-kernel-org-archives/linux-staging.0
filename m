Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07A32908
	for <linux-staging@lists.linux.dev>; Tue, 10 Jan 2023 21:26:50 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id u9so32138271ejo.0
        for <linux-staging@lists.linux.dev>; Tue, 10 Jan 2023 13:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5oFkb9wrIT8eTAaflkSTF4Ydc5BvSrFFAymLLMDqe6g=;
        b=msJKeyEvY7GID76O5kFlxpt8f5s/vI4YPV9ErcdKI54Eeofugxd13XF+9Fj+VU1KDU
         L76Ub5Cg6PamZgJrluJr7GciOV4eefzq8X1X64xArnWv2HcDHFtKoPK+KB+WpkKjUx8j
         3zbIvtSw3dV4MwU9kVRTLJwUTi9b9el4MbxYJ165YTT/zCyhyjGscjPK/gDihU55b72c
         o0K8zDn+ULhGn3I3PISM+70uMIiEdUb5obfUGSXfuKO9Nz5DZsE/TeBs0Dke0cS2AdqG
         a5FRgElSTqVdFKyRBl4y+VXLPv27FkzenpLSx1fXT5JkYpRB0bd5h0sEjRq4eR3nWjjq
         Q2rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5oFkb9wrIT8eTAaflkSTF4Ydc5BvSrFFAymLLMDqe6g=;
        b=2K5+31XFaUwSIDUXpaPEQlL6VwSNHQ1MwqsRKzqoSL0CS3hz9NJUZ6NV3+BOFrOYKJ
         WTuRJMQELtl/bMmocPnBl0msxrpUPjXKmWMGneze1Ln8jW+VKa0uuIR+6NycttR7H7Qv
         LpDtKlkJ1CcEBtf8nefm3YGjXLuyEv4uQ+4t+Nx4ROwmzucL0M2Qj0r7UyKXTIcKIZkp
         EZwXXGh7XCWGV6EN50o6KqBoL9MYTQFEaP1WaqfyxnhT+rQHwpEq3c7uHyjMb2cwTUmL
         GPK6gr4jtFQ0y8QoPbilQXoZwIdABdazp/W4yqYUIb6Nd/3+GzPwpyrqnsOkpMwjZ538
         sEmA==
X-Gm-Message-State: AFqh2kpusWZBKZh5VDYt2dhW/kjFGB0G39stvdS4KNbtGvfQd6+iL4It
	v8TTYrj7dp89CvsNVrlXLthSYK8k7dY=
X-Google-Smtp-Source: AMrXdXtjdLaVSsoK9Vd/PyTdiPnFSTXjxNjJOXNeZCqR6p0kn6YGs0M14c1nmj/moJVa78VPsEqRVQ==
X-Received: by 2002:a17:906:a1d7:b0:7b5:911c:9b0f with SMTP id bx23-20020a170906a1d700b007b5911c9b0fmr13346595ejb.7.1673386009147;
        Tue, 10 Jan 2023 13:26:49 -0800 (PST)
Received: from [192.168.1.102] (p54a07888.dip0.t-ipconnect.de. [84.160.120.136])
        by smtp.gmail.com with ESMTPSA id e15-20020a170906c00f00b0084ca4bd71b8sm5370136ejz.208.2023.01.10.13.26.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 13:26:48 -0800 (PST)
Message-ID: <59d34f05-f952-2ee9-6fe1-703e5339ef70@gmail.com>
Date: Tue, 10 Jan 2023 22:26:47 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 0/4] staging: r8188eu: clean up usb_write_port_complete
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Michael Straube <straube.linux@gmail.com>,
 Pavel Skripkin <paskripkin@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20230110205626.183516-1-martin@kaiser.cx>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20230110205626.183516-1-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/10/23 21:56, Martin Kaiser wrote:
> Clean up and simplify the usb_write_port_complete callback function. Yet
> again, this is based on the previous patches I submitted.
> 
> Martin Kaiser (4):
>    staging: r8188eu: refactor status handling in usb_write_port_complete
>    staging: r8188eu: reformat usb_write_port_complete
>    staging: r8188eu: remove unused function parameter
>    staging: r8188eu: always process urb status
> 
>   .../staging/r8188eu/include/usb_ops_linux.h   |  2 -
>   .../staging/r8188eu/os_dep/usb_ops_linux.c    | 46 ++++++++-----------
>   2 files changed, 18 insertions(+), 30 deletions(-)
> 


Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
