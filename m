Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF347A;
	Tue,  5 Apr 2022 15:19:13 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id k21so23865349lfe.4;
        Tue, 05 Apr 2022 08:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QNjrm+2U8Wp4qQE1rogdNw3rgJSNlOSLgoVBhegCMNs=;
        b=Tqg2yrve07ADWEUbyvd1akmjxeOXld1+zmU3UV3F3XWGv5FUnPXiX9N+VO83Y4JEEd
         MSnqMkjllKlq54jdxCTUsddUW2WhAIPVq2rFPlAyVzZ9GkIu7mkknpkuBo+/cHUY6jao
         yr+/g5L22aSYGDbB4+wgFmKITWcu4VMLxwxjh5UbsBPt18CUlT6vaVOcJnK+AIFRDyN7
         N9s9INLJ3OqDc4X7w3IMv+64eJsxE40BX4ZZh19IPIZJ4IkMDQ68DshnBf0pQXRjLlm+
         986z+zcSdLK9PaBQoLTctUm7b/JffBHCpHC0VaT9Vbl/pzZWS1j9W+eGZLjsQnd4Lk7D
         KSrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QNjrm+2U8Wp4qQE1rogdNw3rgJSNlOSLgoVBhegCMNs=;
        b=fbIhk6E10YkBa0JWiIvYERJ1FGBP7FO6xVR0muZ8WANGHONG9nrP1X+S4iCl/YLP5f
         mbaZcNL4sbqpMdEIK/sQKEPkjJ8CTUSTvk7i6Yq6PP3Ou2sWChgUqaaah3ut3d9BDFo3
         E9yLO1jbEHWeq15djrgBnHG4Gne7sy8naMDd2NNijtk8L+DCanqT+4gGX2tWGXxaaKWu
         FvdVy+J64wfYd5bc64+ZktmAtAABOjrw8pPhlVliaZ+IYeS8TYEDw1/BY2wVHBjdgNm4
         woo5G8DFwCeRbmnLgiyxUU5DQpXw2dlryBcZJyvx0owsITx2Nwh5ssyNNYu94FlzJPlk
         OulA==
X-Gm-Message-State: AOAM533BUdNK4e2bxvrecm9jkmd/Vy+3Y2fP13a69ginhgM164emV+k9
	szMFw7np9xhf+XRj+Cb2LIcPE1y/+9K63SRbIqxG2gCGoPd6Ig==
X-Google-Smtp-Source: ABdhPJxJhOBNDoxuGxa3tHh6Dv34VZijI3nZI9DmqyOTZ9P9dzaQTLrSUZ6XpCmXw9eQQC3cNsaYahVZvvY1gdoam48=
X-Received: by 2002:a05:6512:2627:b0:44a:2987:218b with SMTP id
 bt39-20020a056512262700b0044a2987218bmr3077182lfb.563.1649171952064; Tue, 05
 Apr 2022 08:19:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220405150912.GA625670@euclid> <YkxdasBGZ3m2Yu66@kroah.com>
In-Reply-To: <YkxdasBGZ3m2Yu66@kroah.com>
From: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
Date: Tue, 5 Apr 2022 11:19:00 -0400
Message-ID: <CAMWRUK7c-hqiz+KEFkqBuvu1syCwSnF4UZzbkPFw-VWABm9qOw@mail.gmail.com>
Subject: Re: [PATCH v2] staging: rtl8723bs: fix indentation
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	outreachy linux kernel <outreachy@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 5, 2022 at 11:17 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Apr 05, 2022 at 11:09:12AM -0400, Sevinj Aghayeva wrote:
> > Adhere to Linux kernel coding style.
> >
> > Reported by checkpatch:
> >
> > WARNING: suspect code indent for conditional statements
>
> You are also removing unneeded comments, right?  Please explain that as
> the documentation link the bot pointed you to showed.

I specified that under the --- line:

v1 -> v2: Remove the comments that became irrelevant with proper indentation.

>
> thanks,
>
> greg k-h



-- 

Sevinj.Aghayeva
