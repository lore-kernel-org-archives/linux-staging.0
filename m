Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D206117
	for <linux-staging@lists.linux.dev>; Sun, 25 Jun 2023 14:28:27 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5183075a5ecso537691a12.0
        for <linux-staging@lists.linux.dev>; Sun, 25 Jun 2023 07:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687703306; x=1690295306;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QT+PeXl9J1H04ELBR+b0mv138YocFRtBZpqWo3biTeQ=;
        b=pFPJF+nL1+7yicddC8DWtsDDnARAvpaZoonNi+nkCytcArspBkKMW/H6Z8m1i4K2vt
         k3IThHWOJbCYJOvhQ9UciO34cj40hLlI5GY4pO04K6ndIbaTE3ShF2YL1zdqXXZFngy/
         penTW77DHZA5E/53Wq+19/khWLFktBa4gcsym+hZtOialuLwo+SJGWGVY3RbC3iYBJZk
         RlVIkPcV3Dn2qEvU9YXjjw39L2DvaGYTa/iHvU4kH9JsW26ysURjBIr0fCzukVQm+/g1
         X2skcWa5OwSHSsnc362MYDGbb9NEMzjX1v4HYw8ELSxItEQ9ljQWanDCcswn3R2kIWsz
         WGLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687703306; x=1690295306;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QT+PeXl9J1H04ELBR+b0mv138YocFRtBZpqWo3biTeQ=;
        b=dehqH8yNxkjktWCrRNz1Txdw89Vk+OYEQDSPtswjzFl8f1Qjj+IsMhrejcgZd+zsuc
         uqOGAVObM/QRk/Zki/D7VLiIJXXifg+LmNVlTuYEGukqfi+xaWyJU2+rGskZb5X57iWt
         Id6JDHO6GIEOZP5thknEX64JBXTkCtuuKNYkvoHc8CI3ah68d+LwElQx9lF2BkU0sB0Q
         xzhozIrL+aoV2bTH8gLqciGKNZI+pPSwCnUPn5qPm88ym08xqXcuU7SkBhNAyEje2+fn
         xlF5tDO6w3EqXCcNP6GRBD12dJMXGX3PZD8qgYg7GoTyoUlPkibiUydNppNgWOrvIh/t
         +pbg==
X-Gm-Message-State: AC+VfDwNrGJN4i8TwOp0ggtfo/eqFYdyX9CLb/kbpWg8SXnbrXgn5cgy
	nZmCzGi0QlmzfTtOdX1eyGc=
X-Google-Smtp-Source: ACHHUZ6os37D661SyBYWn8eKEtOqZk83KO6XdClDibKqY0YbZ9o/ON3/tyKS13IT9RTpsbRB3cK6ew==
X-Received: by 2002:a05:6402:254d:b0:51d:895f:aa93 with SMTP id l13-20020a056402254d00b0051d895faa93mr2511451edb.1.1687703305452;
        Sun, 25 Jun 2023 07:28:25 -0700 (PDT)
Received: from [192.168.0.101] (p57ba2e0b.dip0.t-ipconnect.de. [87.186.46.11])
        by smtp.gmail.com with ESMTPSA id be28-20020a0564021a3c00b0051bfb7de166sm1812104edb.39.2023.06.25.07.28.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Jun 2023 07:28:24 -0700 (PDT)
Message-ID: <ca4d6bdf-158b-1d5a-da1f-9401d9d95931@gmail.com>
Date: Sun, 25 Jun 2023 16:28:22 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] staging: rtl8192e: Rename function IsHTHalfNmodeAPs to
 is_ht_half_nmode_a_ps
Content-Language: en-US
To: Tree Davies <tdavies@darkphysics.net>, gregkh@linuxfoundation.org,
 dan.carpenter@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
References: <ZJdz9oWjPuE3xZ8Y@tacos.darkphysics>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <ZJdz9oWjPuE3xZ8Y@tacos.darkphysics>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/25/23 00:53, Tree Davies wrote:
> Rename function IsHTHalfNmodeAPs to is_ht_half_nmode_a_ps in order to
> fix checkpatch warning: Avoid CamelCase
> 

Hi Tree

If you look where the function is used you will see that it is used in 
rtllib_rx_auth_resp which is used in:
rtllib_rx_auth which is used in:
rtllib_rx_frame_softmac which is used in:
rtllib_rx_frame_mgmt which is used in:
rtllib_rx_InfraAdhoc


This has for me to do with access points so please do not cut the ap apart.

Thanks

Bye Philipp



