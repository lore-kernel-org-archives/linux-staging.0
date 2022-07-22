Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5B52C80
	for <linux-staging@lists.linux.dev>; Fri, 22 Jul 2022 18:51:08 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id u12so1863621edd.5
        for <linux-staging@lists.linux.dev>; Fri, 22 Jul 2022 11:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=iEc3QibtkQB1h4TtSqccZQnGVDITp8oWtoE0M/00VQk=;
        b=GpGH7+7RBNLB4ERAP5aPNGUstRTGng8DobHWVI1kDtI0OXjU+zZIufvP7GM94p1RFJ
         Myu8OlHivlzSydD/yaZ4v2YbkeW2OOeevQCe5edKJhXpPh6YkH1n9zonI/fcGGjRCznc
         Z+YE9k7C1WrLsZHyQ+/d0FFuR9tzVhv782GgGH8Fk6jWQEBCDjSlkrItxuiY3Ky5v0YO
         /9DtwklLtYkRHdf99m3UqvP4wpNX/xz4xvJJrGEdhaH/CT0ZdZQcYrOjA4dvVfmHQlPe
         T+AxH6WI2WryCstt8r5eUbP+AjshGuvUYv+5lZssHJaS7KPlcjr6sCp+T9/5qurkXfY9
         Jv0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=iEc3QibtkQB1h4TtSqccZQnGVDITp8oWtoE0M/00VQk=;
        b=HBkBnDIda/LSCXvQfh8Dd3sEkSjKmjh4k3eL843N9t6AI7/N0PPSABZnsXzrLy8Z/p
         ZpNOWkjoCQiAuSkkiDdAjKy7nqKbEiMSPMeUiaKukknsluJhWt2z+aKeTRMbnEC5LFQA
         fPYrs0Yj55Tv3Xg0dd1vFjxVlwHdpHQXyj9oFx9zjVlPrV1O+tZAPb+l3xUeG3+qTJuY
         1P8uQKZ+AKtY1mkvGzI4yqOvsk22wZK6l6LtrtziICPmbjEWoHMlyjnOCqRyvE8PwRKq
         HAXh3+ECDK2gPXotpb4JntKch4RWxUc0ohhIXDRdI+syuToYVOD8ttDK58HFjK9l4Lbx
         FyCw==
X-Gm-Message-State: AJIora/MHpxuW3OEBjtffBFzmbcXaH4ivclLc2MGfMs477l2JFo3umbS
	ZpqSVuYeZ0ehwxmxoUE+Ds8=
X-Google-Smtp-Source: AGRyM1tXdMIUQgykOTSlieMCzsF5hlEiszoOa249GdZLeCLe64pZ9bUR1e5zamycMiPMGKC7VcLVeQ==
X-Received: by 2002:a05:6402:1e8c:b0:43a:c57f:2cbb with SMTP id f12-20020a0564021e8c00b0043ac57f2cbbmr1240037edf.97.1658515867058;
        Fri, 22 Jul 2022 11:51:07 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2e:6976:6ec9:79b2:9979:d758? (p200300c78f2e69766ec979b29979d758.dip0.t-ipconnect.de. [2003:c7:8f2e:6976:6ec9:79b2:9979:d758])
        by smtp.gmail.com with ESMTPSA id ti4-20020a170907c20400b0072faba59dd1sm905617ejc.165.2022.07.22.11.51.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Jul 2022 11:51:06 -0700 (PDT)
Message-ID: <fb10f8bf-d2d8-a2e2-435a-62bb9ce02973@gmail.com>
Date: Fri, 22 Jul 2022 20:51:05 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4] staging: r8188eu: Inserted empty line after
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
References: <20220722161744.14914-1-abhijeet.srivastava2308@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20220722161744.14914-1-abhijeet.srivastava2308@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/22/22 18:16, Abhijeet Srivastava wrote:
> Warning found by checkpatch.pl script.
Empty line missing.
> Signed-off-by: Abhijeet Srivastava<abhijeet.srivastava2308@gmail.com>
> ---
> v2:
> 	- Fix my name on the patch
> v3:
> 	- Fix commit message
> v4:
> 	- Fix body of explanation

I would like to give you a reviewed by but now the empty line above the 
Signed-off is missing. Please have a look at the canonical patch format.

Regards,
Philipp
