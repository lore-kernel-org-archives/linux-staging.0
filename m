Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20F42C82
	for <linux-staging@lists.linux.dev>; Sat, 16 Oct 2021 18:59:51 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id r18so52277177edv.12
        for <linux-staging@lists.linux.dev>; Sat, 16 Oct 2021 11:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=skfeQJo7hKVQdukfcLCg8zqWpJh75xXNSTOi+22jEa8=;
        b=UqxbM8jmPTqerLRDSuuNvVsIfPngxRBalWaCmshagQkDn0w/EM2IcmSvfsj8yPMb/w
         UrcP46Vr6ZhTIp5x6avRhgKoH/KhDpX4b8Re/HHju+Ql9Zo56DpmZLXampR6kskJr0gy
         ozqUbf5Tdy5edmKCpN70684Zjyk/lHRgSR7gnPMKK6oZQUOvQ/GetW1rC5SRC6h4iTF4
         51B9Uhl7maIfST6Bn4VcQM7RoWGNoxuxwOQfmXzqpwL61c/CfcSzbfL168/OO53VUxfi
         Pmhs3XEn/0AQltZ93DTIJ8OF3dcDwTmD/3mtMovUKT6Lq0NiSZraFkb0U+XcWrm3GWEA
         S32g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=skfeQJo7hKVQdukfcLCg8zqWpJh75xXNSTOi+22jEa8=;
        b=gKOH0nGcqhgcrSnhTYhMFFVuSaqBXD8bRFQhAabk57XcyzKEs8qFZoHnCaPvl/NQgH
         t2bEdQvAbYlpPYH2mvgcpnJlU1XX/5B9tpmjRQhlZgQzd3xoLbcWdjn56atjBMBDahNO
         X4LQavogCOXVrKWMw0TpOTMbljnF+j+Eqj4FgF3cH7bPieZ4CzwdVKZ8olOuNuL6oATD
         B+bA8taAnR4nKQ+LcJhoaMsOrWPqL0Hu5T3EZmMAYxNBzyKsI16Ax4uMcWQgMtDACE9T
         3m/XiSPhRkit6HicGU6+MC+JYWlpELjgXR6LGaCsnUAjwuPjZN8rR4a5n7c8YqF3xnr9
         2NMg==
X-Gm-Message-State: AOAM532UZw7TFj5k9uXV0FFDD+8qR2Foa56HyvIv0UfCDOB8kofGHnuG
	m57ofgLv3r4anqcM1q6fW2s=
X-Google-Smtp-Source: ABdhPJyrK7CbW57goS6ePYN64wESYguN0CjsgPw8LH/mKt94yOBLJsuBh67IOZDAHMjqX4OTsPbTeg==
X-Received: by 2002:a17:907:629b:: with SMTP id nd27mr16085911ejc.24.1634410790068;
        Sat, 16 Oct 2021 11:59:50 -0700 (PDT)
Received: from localhost.localdomain (host-79-47-104-180.retail.telecomitalia.it. [79.47.104.180])
        by smtp.gmail.com with ESMTPSA id lg3sm6510831ejb.78.2021.10.16.11.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Oct 2021 11:59:49 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Martin Kaiser <martin@kaiser.cx>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, Michael Straube <straube.linux@gmail.com>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Martin Kaiser <martin@kaiser.cx>
Subject: Re: [PATCH 2/3] staging: r8188eu: daemonize is not defined
Date: Sat, 16 Oct 2021 20:59:48 +0200
Message-ID: <4247755.Dd3urQpL4E@localhost.localdomain>
In-Reply-To: <20211016181343.3686-3-martin@kaiser.cx>
References: <20211016181343.3686-1-martin@kaiser.cx> <20211016181343.3686-3-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday, October 16, 2021 8:13:42 PM CEST Martin Kaiser wrote:
> Remove dead code that depends on daemonize.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>  drivers/staging/r8188eu/include/osdep_service.h | 3 ---
>  1 file changed, 3 deletions(-)

Acked-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>

Regards,

Fabio




