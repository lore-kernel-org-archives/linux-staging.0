Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E5870
	for <linux-staging@lists.linux.dev>; Tue,  3 Aug 2021 12:23:29 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id x11so35169572ejj.8
        for <linux-staging@lists.linux.dev>; Tue, 03 Aug 2021 05:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XtlBN5e/EVpe5xwv2aVry/eQDKWqwL83Vio3Gr+T1UA=;
        b=MDI+Ew8CkVlcfRk09T7+lidlFk5Se+Ws6iehNSQhtwW5KrOnmtn/0m8QeRTLIFO3GY
         H2Twro7MvsBZLrgje+WVN3RVG/w0CC1kaG2DsUUDDpOZblATI+PicPhly91dTSNjVCj0
         2IBf1jaM8MHnTlfnqqVjxJmU3EZKvI9HN1GAZ5IlXEHODyYq/xMa7TL7LSMZO8M98Lzr
         FqIFeu86o3y5duVTTzCWIl5eSmiYDHHvAEsrtBk33JQ8qL4S81NvKGIw34RlA4bjEhke
         Wx1xKOSrh9b0MtsUWjN8o+9LqUnwZAlquEYqCl/egdFNn0lvT1w9QXieL04GrVCMW1wX
         YT0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XtlBN5e/EVpe5xwv2aVry/eQDKWqwL83Vio3Gr+T1UA=;
        b=XJO/kpKqTLKJzafVdNm8NwBhq19P1R2G4g1tuSE2x8Zp9IUrVlLm8PHxMGImaSMcY5
         vFiNvDRi+ub2DXZWTqXGavbe2JYXinCpyuC1J9J1xTP6AVAuRuAq5pTn6sMX6Z2GoNug
         K3wDPD/nkst8lVd3Z1oCkcVrI6ulsr2ENcMUwVrmgIHXsGUnM4SF+c5DhqV9/lP247Wm
         qzm6VLXvgw4CaNH61dwCmAhCh53UdrCfo0wJKsdiD4BeR7FnbOrzO7fyA6h0O95LIefK
         n4gegUrt6HKqrzwA7B52PR+8uX//5Q5uGQv3zQZ85uMlHSaEngr4nriJ9ceoPdoDUemh
         PFDQ==
X-Gm-Message-State: AOAM533M0z6xh2JWwt32yVOrxf10G8ZOdIKE4E8dhyaa/uOx9CPY/JaK
	b9llwDiw+8NRpoUnSORuoC4=
X-Google-Smtp-Source: ABdhPJxfr66p7gLYa1C8qI9woDWHJhCUQ3mR5zxfUTBCPiRHyN5cpvTx6WuKWVF1hOIHLOe95qZDtw==
X-Received: by 2002:a17:906:9c84:: with SMTP id fj4mr19921594ejc.180.1627993407065;
        Tue, 03 Aug 2021 05:23:27 -0700 (PDT)
Received: from localhost.localdomain (host-82-51-42-96.retail.telecomitalia.it. [82.51.42.96])
        by smtp.gmail.com with ESMTPSA id s12sm6142403ejz.36.2021.08.03.05.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Aug 2021 05:23:26 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: gregkh@linuxfoundation.org, Fabio Aiuto <fabioaiuto83@gmail.com>
Cc: hdegoede@redhat.com, Larry.Finger@lwfinger.net, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: commit c7e88ecbe328 ("staging: r8188eu: remove rtw_buf_free() function")
Date: Tue, 03 Aug 2021 14:23:25 +0200
Message-ID: <26260563.P9vmH3Ooqy@localhost.localdomain>
In-Reply-To: <20210803072129.GA1422@agape.jhs>
References: <20210803072129.GA1422@agape.jhs>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, August 3, 2021 9:21:30 AM CEST Fabio Aiuto wrote:
> 
> Do you have any idea of what happened? This
> topic could give us all deeper understanding
> of kernel memory management.
> 
Hi Fabio,

I've just briefly looked at that c7e88ecbe328. I have no time to dig it deeper 
but at a first look it seems that the following line is the culprit:

kfree(&pmlmepriv->assoc_req);

It should be:

kfree(pmlmepriv->assoc_req);

The second line frees the memory location whose address is saved in assoc_rec; 
the first line instead frees assoc_req itself.

Regards,

Fabio 



