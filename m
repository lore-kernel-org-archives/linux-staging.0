Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507E83FC0
	for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 09:13:00 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id g19-20020a1c9d13000000b003075062d4daso8485227wme.0
        for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 02:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=76q8V1XO/uXWgYaoiSEJ8zGvFMP1hD8UrP5IH+LteFI=;
        b=LqPz7SIhuQxfwU+hOnXNmzpfY/lNQledmDJp/3I1AVOu8ZRo2tNa86aiKYd31hzjHp
         nbVHItEHYYVh4mxZ1r6CkepCJPi/DnBDc3VHfxSDX6afAK07F+xfTytkeUtp5dGs6Bx+
         YmTz7p5BTtAH0pj4ediLrs6rmK1Z4Yd3Ac/WxysjRh4HfAnJgaTzeVlw5rrCA0AtnrSC
         igPsPl+Q2svZrxk9WL9LMiWrHCl3uTjRTEpkCEj5rr122mJc4gY9SQpeFHmCVDI0bua/
         RlZFQpgOBe2NJGuE+V9tk+6HFUr7UeFiB3XoswNmzx6o1PooSeiJa9vAqfc1+MFh756v
         L+Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=76q8V1XO/uXWgYaoiSEJ8zGvFMP1hD8UrP5IH+LteFI=;
        b=ajoJjHlL8iZ0X/3cP4/X9Vwjw7uNfo8bcm8Dc/J1g+bCxbeQYJO8Wy9+dxbFDuifh0
         UcXbOef9Uex6J3W8Ce3lU70vTHkxXRi80It8sjYB7WfsJTuiiY4n+tWLorElwb7LGr2D
         4OtpeXQmhRXEqCLWFLvDgiXtNJHR7X1xl36u2+QkGm6gX2nhEO6kvHuSba7S7Yh2Ui1Z
         idH6ePug3ek8wsjIT0SP2+1K8u1jdccOxQ9h9bLeS6frvkbPjysafFJsOoeCXA03SsS6
         kMqhOB20JUa/r0PcgfUhkY58QpZJCpkC1DzxfCbr53uYY7cJ67/rft209+5iYItxGH2T
         J20A==
X-Gm-Message-State: AOAM531Piqi8UqC/aPeq6PWFbLm/D4VAEz7pTNTkYmKeFtv9CwYiJ+BG
	J29tp1Rzd2aMrJV69Awp9qQ=
X-Google-Smtp-Source: ABdhPJy9Ydpd3gzR4aYcZaEGDWJOHipzVUf95UzPZERPDqroefiNjVfNgK0sEPnzQPUabmATjkHSKA==
X-Received: by 2002:a1c:448a:: with SMTP id r132mr14986786wma.105.1631956378634;
        Sat, 18 Sep 2021 02:12:58 -0700 (PDT)
Received: from ?IPV6:2a02:8108:96c0:3b88::ae40? ([2a02:8108:96c0:3b88::ae40])
        by smtp.gmail.com with ESMTPSA id j134sm6103125wmj.27.2021.09.18.02.12.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Sep 2021 02:12:58 -0700 (PDT)
Message-ID: <b62ae16e-5eb3-e51d-dbda-5f0790de128e@gmail.com>
Date: Sat, 18 Sep 2021 11:12:56 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 11/12] staging: r8188eu: remove ODM_IC_11N_SERIES,
 ODM_IC_11AC_SERIES macros.
Content-Language: en-US
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk, martin@kaiser.cx,
 fmdefrancesco@gmail.com, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20210917233048.31677-1-straube.linux@gmail.com>
 <20210917233048.31677-12-straube.linux@gmail.com>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <20210917233048.31677-12-straube.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/18/21 01:30, Michael Straube wrote:
> The macros ODM_IC_11N_SERIES and ODM_IC_11AC_SERIES are unused now.
> Remove them.
> 
> Signed-off-by: Michael Straube <straube.linux@gmail.com>

I just noticed that there is a full stop at the end of the subject line, 
sorry. I'll fix it and send v2 soon.

Regards,
Michael

