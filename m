Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F75E70
	for <linux-staging@lists.linux.dev>; Fri,  4 Jun 2021 12:34:08 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id i14-20020a9d624e0000b029033683c71999so8911603otk.5
        for <linux-staging@lists.linux.dev>; Fri, 04 Jun 2021 05:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tCu/tKeYJwFaB3OgK7bagOEU6jq2x5jscMl3fnvsW4U=;
        b=qnFJVP/DW5Te8bJnZoC2h1qT0G1R0vO9fkYS5f86+H4eEFZNB4QZQXAvpUr7Pn5Owv
         SaHLAHFjSrMFdaVxjlgur5uvyZPRHgotUV+2TjuI9BM47xZX+uLq2WuJvmRj/vOom6AV
         mjPUniSxHJ1Apdu9EamFo9v8LPDBNovSP0C7QlhoXh8ZE+qRNi3ygF0axGGMgwycg4QX
         dONIz8rOqEGNz1hNS5/uBmWmMgAyD5bGfTbmGL3wUwYhz5/L/46bEu6K/b8hVe4NmHfR
         45Cnc3QfFb13qx2VeqkTK/jobUDS32F2IN4mA793UFCxIhQLaLPEKnbCm/OdEJ+C/H58
         TR1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tCu/tKeYJwFaB3OgK7bagOEU6jq2x5jscMl3fnvsW4U=;
        b=g4ThVknziE0MTnobfrWz9xXMjSVw1mkiIHdk4mMPBYT2O6xKNPAjJrAg/U75NOoKhU
         rXECvwkwqbuQDCgeqGfaw5Eoj/1dm8N6t4Ew8+I+aO2z5tB3RNapmcZNizSnBCyhEjlU
         BGNdjJiBYwGF4229hChqxgSGDdsi1k4YKz9wkedWy9+qD8l83EuDSG3zXL5rAVUUxiXR
         EJytTCvk674cyNj4ZasGTS8Mdpj+LKzeqfHs6hRxER3do0Kl+FkSQng6lw0PsNoCXN3Q
         /kB0wgZvW61uYTmaI2otIu4Xkpg2wOzO8T2gFgdAjcDESJ84dtkgosxWyIk90tYKX6EX
         b7vQ==
X-Gm-Message-State: AOAM531ho6psCmL2QeIf1KkRbW3gx8f7+7Oco0AR+J21fpiC73Qpx4UV
	erIxlcJZaDzuu3apkqf8+xQ2DA==
X-Google-Smtp-Source: ABdhPJx/leSy51Y3cV58L2zpY1aK2i6EasrduwOlR++peaXucg2t2uW8ciCzlwcdAECGF6C5CeU/lA==
X-Received: by 2002:a9d:29:: with SMTP id 38mr3622473ota.30.1622810047206;
        Fri, 04 Jun 2021 05:34:07 -0700 (PDT)
Received: from [172.22.22.26] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id a7sm403852ooo.9.2021.06.04.05.34.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jun 2021 05:34:06 -0700 (PDT)
Subject: Re: [greybus-dev] [PATCH] staging: greybus: fixed the coding style,
 labels should not be indented.
To: David Laight <David.Laight@ACULAB.COM>,
 'Manikishan Ghantasala' <manikishanghantasala@gmail.com>,
 Alex Elder <elder@ieee.org>
Cc: Alex Elder <elder@kernel.org>,
 "greybus-dev@lists.linaro.org" <greybus-dev@lists.linaro.org>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 Johan Hovold <johan@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20210602133659.46158-1-manikishanghantasala@gmail.com>
 <9a3878fd-3b59-76f5-ddc7-625c66f9fee8@ieee.org>
 <CAKzJ-FNW8EPX2oQd1qr5NagnvjtWwvSeuAh8DNLetj11+BJ6RA@mail.gmail.com>
 <792dd57c0ef8454497e5ae4c4534dea2@AcuMS.aculab.com>
 <e1c36fb4-ab72-0cce-f6fe-3f04125dae28@linaro.org>
 <e23879ae78404be2b707b550b3029e43@AcuMS.aculab.com>
 <10ad30e2-c906-b210-bf0e-5e20b6de1993@linaro.org>
 <c29b5c97f97b48c894917647915bf510@AcuMS.aculab.com>
From: Alex Elder <elder@linaro.org>
Message-ID: <613239d4-c4a6-8585-5f9e-0241f0caa5ec@linaro.org>
Date: Fri, 4 Jun 2021 07:34:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <c29b5c97f97b48c894917647915bf510@AcuMS.aculab.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 6/4/21 3:13 AM, David Laight wrote:
> Yes, and it isn't at all clear what it actually means.
> If the value of a bool memory location isn't 0 or 1
> what does 'bool_a & bool_b' mean.

I think this discussion is done, but I wanted to point out
that the above expression is incorrect.  It might be valid,
but it would be bad code.  A Boolean, when properly used,
should only be compared with true and false (or the result
of another Boolean expression).  Therefore "&" is not the
right operator, "&&" is.  The reason is similar to why you
would never use ~bool_a, you use !bool_a to invert its value.

					-Alex
