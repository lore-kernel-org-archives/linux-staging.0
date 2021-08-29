Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD03F29CA
	for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 12:48:14 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id x11so24922099ejv.0
        for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 05:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7r+jlTTOw/kHZNfLJXUEqsdPJdmMql3Pod1m4pzmZ5Q=;
        b=NRYojbaVZwoneKyzCwC4PqTG1+R+i6CMjPgxQN4zp7oLu5efi7GBF0kdnVe8vn/rnm
         VA8NtjT/l3cXlSe1YgXVvDktDo6CUPIYiuBHMVDdm5F3t/sD9H+sBG+1ZutNhajav9aW
         rCrWVB+BchQswaX3oB2Cm2S9SDlGPs/IYpwyG7oxG+HdURvWnkuBhQ85Zk/3/D9UBFda
         IeFoVeDnL6T1bVfpAvoP0fQez5UFmqhQOpSGujQiCjNtWcyxvqWuiiJiW4KpoDvE23Dx
         ytEwVdRpSoK483LtWZ1QpG9asrmYB5RYsxZ5kjTvbw55fgtlaChHxggXkepprW/ioxOj
         TjzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7r+jlTTOw/kHZNfLJXUEqsdPJdmMql3Pod1m4pzmZ5Q=;
        b=raLOvTGD4F7hOp6Xum3V0TuxqUIA/esZQcKCMtQ3UkJgNxUscYOjeZPXPMvDgEdTmm
         SItVeDR7rTFRgwpNxAlSSH67ZVuayQvj2yEASnrbr25yTZH1sMg/mgYTvrRiemaQcxE1
         GLGz/9xVYzNprLE9CZk7X0OIOPU/HsyepjqdVVZ7iaoLNEBjZeSGsMQcdxl/qFG97TWG
         2f3Aiaga4xfspiAsQeXPDQ9VJIRQ1sqbGuu/WoAYJ4qnh6hZMyg2ZKbDTKljAdnahZn+
         K4grsa3ZU9fg8QdoI2S3+eTvnLmIF6muKjoASS51vygfyw29Lve0RZaOElz1PidwaK9w
         KWxQ==
X-Gm-Message-State: AOAM533fSls3dpNKjPH/T/85wvSje8DCueLZz2OPSC+dDSKDV9O7B4L/
	BxBmSmWIiZ54BGZWq6jV+vI=
X-Google-Smtp-Source: ABdhPJwj/2aMWbl1wJy3iIdg6yMQrhoVdgxo312L9xENDD3XFzIXP8QDHVw5pDWB1Dchk2mk2Y0bbQ==
X-Received: by 2002:a17:907:75d0:: with SMTP id jl16mr20538725ejc.166.1630241293123;
        Sun, 29 Aug 2021 05:48:13 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-100-164.retail.telecomitalia.it. [79.22.100.164])
        by smtp.gmail.com with ESMTPSA id n2sm6273410edi.32.2021.08.29.05.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Aug 2021 05:48:12 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: gregkh@linuxfoundation.org, Phillip Potter <phil@philpotter.co.uk>
Cc: straube.linux@gmail.com, Larry.Finger@lwfinger.net, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] staging: r8188eu: cleanup c2h_handler code
Date: Sun, 29 Aug 2021 14:48:11 +0200
Message-ID: <3884124.htuf3bXTbR@localhost.localdomain>
In-Reply-To: <20210828212453.898-1-phil@philpotter.co.uk>
References: <20210828212453.898-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday, August 28, 2021 11:24:50 PM CEST Phillip Potter wrote:
> This small patch set cleans up the c2h_handler code in the HAL layer
> of the driver. In r8188eu, this field of struct hal_ops, is not even
> used, so dependent code has always returned _FAIL. For this reason, we
> should remove this function pointer field, and the wrapper function
> which checks it. This is done in stages by this set, and helps get
> the driver closer to the pointer where the HAL layer is
> deleted/integrated as necessary and no longer a separate entity.
> 
> Phillip Potter (3):
>   staging: r8188eu: remove c2h_handler field from struct hal_ops
>   staging: r8188eu: simplify c2h_evt_hdl function
>   staging: r8188eu: remove rtw_hal_c2h_handler function
> 
>  drivers/staging/r8188eu/core/rtw_cmd.c     | 23 +++-------------------
>  drivers/staging/r8188eu/hal/hal_intf.c     |  9 ---------
>  drivers/staging/r8188eu/include/hal_intf.h |  4 ----
>  3 files changed, 3 insertions(+), 33 deletions(-)
> 
> -- 
> 2.31.1
> 
Dear Philip,

You work looks good (especially after having clarified a couple of minor doubts 
I had expressed in another message). So, the entire series is...

Acked-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>

Regards,

Fabio





