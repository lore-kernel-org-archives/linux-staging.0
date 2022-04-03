Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B63C7C
	for <linux-staging@lists.linux.dev>; Sun,  3 Apr 2022 12:18:07 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id p15so14642286ejc.7
        for <linux-staging@lists.linux.dev>; Sun, 03 Apr 2022 05:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=QvjIgpbYP0AE6cl4O3RydzzNsUQwz26DYQCH/eouy64=;
        b=f5frQnxK7uaM8FUwx5q4Iy5wVI1d1DwBKl/6tkrg4H5H91G0kNf/df1m8SOx2VZ11/
         aK41kEj+C25hMNdpbZa32MIkgj01ymwWZnxAcK4m6+P7GAXe6eu4c6qw3dMgJfuqH/MT
         sRh10Qgt+yw8IBYAkvlRUGHtHC7YkS5yZ7TanH+UF61YQGjR9R8ILky0XcPcrZsMg5A6
         jykHXC4mP3nJZTvcDE2z6lu/ClJ3c6Hg/vxTF+OBPebrKheIIZ/R/Q/Z0solK+jHlYn7
         fbfiHuofFucD0SkkcpjITJnB8l/x87F0KvRtX7+vZ05OeF377AjxoE+3CG3qJbCu1zYV
         wgEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=QvjIgpbYP0AE6cl4O3RydzzNsUQwz26DYQCH/eouy64=;
        b=E+NUIY4SQcIDhP/9Vj0lrjfm7FAqG6OXvkjWvF9DaQ3HcgyGkZC5QnM4Z0KeC77WFl
         Rzs0IsS/mAcXrw6MX2VWj5SUWW29bbVv4RdbNh6AqXGf52urbxXMPJkTBKkErKfMqOJm
         fT5Gru9S6loFI3DyUhpz15ADloguzEUP4njaaCzsHqylM+PwwNwEzu84za9hAWK6JhC2
         yRVtSCYHrKboDabSbf6i1Tu12/bssloFDyuspFGorVeKpL4WnvVrVvP5imu6k7ABdseE
         CjVfY/p6/48f2N6l6qGp58BNebl0jkPEt61Q+kT+iepxIPow1jScoy4w/ZHhMT0aixh+
         B6Wg==
X-Gm-Message-State: AOAM532Md5pCVs1oMqPkjxWNUVJwCFnCdjVjwRlD+y9oCmlB4kg2+5Gi
	co3fy0mDSA3FJ7xYpBl/OaI=
X-Google-Smtp-Source: ABdhPJyZk64Gf+4esdRzmYupZUsrBhSqUtT5RydmSA5vuqCCLk3J87Isu/YnNmpJTDuxMTzu25z6Hg==
X-Received: by 2002:a17:907:1b1e:b0:6d7:31b0:e821 with SMTP id mp30-20020a1709071b1e00b006d731b0e821mr7064454ejc.334.1648988285519;
        Sun, 03 Apr 2022 05:18:05 -0700 (PDT)
Received: from [192.168.0.253] (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id k14-20020a170906128e00b006e4b67514a1sm3230167ejb.179.2022.04.03.05.18.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Apr 2022 05:18:04 -0700 (PDT)
Message-ID: <617af7b6-eeac-372a-7bbb-828db11a2aa9@gmail.com>
Date: Sun, 3 Apr 2022 14:18:04 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: staging: r8188eu: how to handle nested mutex under spinlock
Content-Language: en-US
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
 Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <356c24cf-625b-eea2-2c04-ce132d881cac@gmail.com>
 <bf1137fa-5051-a834-0c1f-042c5a8074a3@gmail.com> <1858641.taCxCBeP46@leap>
 <2366209.jE0xQCEvom@leap>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <2366209.jE0xQCEvom@leap>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/3/22 14:10, Fabio M. De Francesco wrote:
> For a list of all the paths to a given function you may use Smatch:
> 
> ./smatch/smatch_data/db/smdb.py ips_leave
> 
> or
> 
> ./smatch/smatch_data/db/smdb.py call_tree ips_leave
> 
> But perhaps you already know how to do it.

Yes, but thank you anyway. :)

Michael

