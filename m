Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC7D15A4
	for <linux-staging@lists.linux.dev>; Fri, 22 Jul 2022 04:49:47 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id mf4so6664584ejc.3
        for <linux-staging@lists.linux.dev>; Thu, 21 Jul 2022 21:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=1zgKFONMAPUnEZdif9mwsS1RgNyE/IjZaTchcJxAMaU=;
        b=fLGzzFvhPVbsLb1WK14VBOQMUFx9+DHe333kbwp2CdISyNeDXFAcMO0fbvByMVj9+G
         1wVQVpL6LTLc3wrkC6fK3j0+WbZeEcejycSsmMiz/l3PQvxstFs9iZFB18Bu+TFaxGoF
         QG04LinNAWz9m7W+bnzYZXjFND6cx0n34UnQMskMHDjzb2mcAm9weohqnIerND4yVs0t
         bMOu5hdZ7hcmXbqvwed/RiG7ExU6Jfucv278pbnSGaRIxGURY7is/FuuX4qpmFqn8gsZ
         bCvPXkutQ6uFcH+ze0f8ocYn5Zj6HmxFC7Gw+eOn4hsRNSZLwhY/rrSxb88sO64piAn3
         LdQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1zgKFONMAPUnEZdif9mwsS1RgNyE/IjZaTchcJxAMaU=;
        b=IcJ/8uHccV3P2fFLFG37TPsDwAX2lrP9PJaIgd/Ss7TofnFNZgJWvUCTz0Rr5CCoyM
         xMXvR1r+qKQkOgSIRypWwB2sc5DA1+JfAQF08hB1LMRVeO2QGdawb8m8fmoxg0C+naM5
         mxA88PHrs596cEA1I6N2af53XqwjQtFTYXveYhZP+2khA/WEWQ2RcAvDPgAkdOm5hXF0
         Dyn3VHc94dRrMN3kaTjo2HpCHYC4pP1a8cPDbf1IlH0fCbXHE0tawZRUEYFOaOiXyIw+
         hx9rYUT6fw4ErYEqootbPiZ1ccJuXYpZe9sEwX3nqseK6ktlOpYCk9Oa9x996dfvtGOF
         wqnw==
X-Gm-Message-State: AJIora+yJm5uYIhVICjvRbQwBbAukb+6EEWqhtlBDsCrO2E1WJGI3LAl
	qtp8dnf2ANiZgxg6QrvJgqg=
X-Google-Smtp-Source: AGRyM1sMG2+NAd9ylOZyoM9OoIAxRtk2Z3XZC1xab3vRWup2a/WqJRRaxBdbwFnfFSNwHpLBrAOuhg==
X-Received: by 2002:a17:907:6e12:b0:72e:6774:cb80 with SMTP id sd18-20020a1709076e1200b0072e6774cb80mr1546317ejc.504.1658465385834;
        Thu, 21 Jul 2022 21:49:45 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2e:6979:bc71:385a:5363:16f9? (p200300c78f2e6979bc71385a536316f9.dip0.t-ipconnect.de. [2003:c7:8f2e:6979:bc71:385a:5363:16f9])
        by smtp.gmail.com with ESMTPSA id kx23-20020a170907775700b0071c6dc728b2sm1540338ejc.86.2022.07.21.21.49.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jul 2022 21:49:45 -0700 (PDT)
Message-ID: <99475d8c-d556-18b7-ba14-465b19e1472e@gmail.com>
Date: Fri, 22 Jul 2022 06:49:44 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3] staging: r8188eu: Inserted empty line after
 declarations
Content-Language: en-US
To: Abhijeet Srivastava <abhijeet.srivastava2308@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>, Pavel Skripkin
 <paskripkin@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michael Straube <straube.linux@gmail.com>,
 Rebecca Mckeever <remckee0@gmail.com>, Martin Kaiser <martin@kaiser.cx>,
 Vihas Makwana <makvihas@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20220721141051.45447-1-abhijeet.srivastava2308@gmail.com>
 <20220721141407.45663-1-abhijeet.srivastava2308@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20220721141407.45663-1-abhijeet.srivastava2308@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/21/22 16:12, Abhijeet Srivastava wrote:
> Warning found by checkpatch.pl script. Resending this patch after
> correcting my Username
> 
> Signed-off-by: Abhijeet Srivastava<abhijeet.srivastava2308@gmail.com>
> ---
> v2:
> 	- Fix my name on the patch
> v3:
> 	- Fix commit message

Why is the "Resending this patch after correcting my Username" still in 
the body of the explanation?

Regards,

Philipp


