Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA81B72
	for <linux-staging@lists.linux.dev>; Tue, 31 Aug 2021 08:40:27 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id b6so26354555wrh.10
        for <linux-staging@lists.linux.dev>; Tue, 31 Aug 2021 01:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=tpgdwJ8aV/oJ/3Y288K3Jw8J276wPQjTvmO8SwKNYG0=;
        b=bjo1Law/Ha4kZL71sTf78aIyaLtyP4Wpd6cl3zusSDioAxkSeyi8SPBxU48tgylgwW
         MaZEjHcZ+h1Bt0vsWsCMNBReFQEgSWeQYJEjyfTEBPEs8rnxB9fUUIOel8n6J+Qr/BSl
         orfWqHLIYfecr/09JrE8xUDH2vndw3oRyDDrQ68o6tV5pzt3+8U62HwRA/eHhLEVwVEY
         sfOFhuzc1DpWXUSbbR7I5/ogiFLJsA5twJFB7zhpWqyN/dD2k1FXcgUBUfOUKOIg0bwx
         iXioON0NpfUjbPd3LziVExTPGK/Ly/SlUiq+3YKJBGO8DpMu+E6DXKbKIEj63y3XErAc
         +l4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:from:subject:content-transfer-encoding;
        bh=tpgdwJ8aV/oJ/3Y288K3Jw8J276wPQjTvmO8SwKNYG0=;
        b=G8u5NQqJlYq7UrPLPFGYErZlSw2HNB/uClY+M99utEB/zVel8Ecq4IKrXDLAsz1W6l
         gEinm9AhIgSmz49wigLujJezRoC70rml4IvC0nCuhUPOD7ngTqEeYcndeYy4PwEeQ855
         tAuBcWQjQpiuy+TLVC/U16FUrMbcSS/m3Ozydz/ZTqphmuT/Kgc3TegYXZvYhjDrr5Ts
         rmOM52DoqGC3+Nz6NNCWo2IwjDylGmhqO4Onb1NDe5zoBXx2rmpyQrXwH9/IbwE2VgCE
         gwN6IxxgBT59dXhrjha/34raHz9udmz+OXG9aFmeL5C85lew/B6QwxbBNsp2Ufz2xwbC
         wblQ==
X-Gm-Message-State: AOAM533aH61+c77FPyMUt4JEhji3ycKJAWG9tfx0eA+tdET96jxg1hUw
	9/dTonVlLV0PYQ0UDJOCyTM=
X-Google-Smtp-Source: ABdhPJxaJhQc1E1GI4ZOjM9kN7WMKJxNo7mJuOBcpIOTMwzlrx4OAnWGu5fGKdaElx3YrQlghpeSMA==
X-Received: by 2002:adf:9151:: with SMTP id j75mr30305889wrj.68.1630399226261;
        Tue, 31 Aug 2021 01:40:26 -0700 (PDT)
Received: from ?IPV6:2a02:8108:96c0:3b88::884b? ([2a02:8108:96c0:3b88::884b])
        by smtp.gmail.com with UTF8SMTPSA id y15sm2002528wmi.18.2021.08.31.01.40.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Aug 2021 01:40:25 -0700 (PDT)
Message-ID: <85959c1f-80d4-3fd9-f8a5-d7688e337e95@gmail.com>
Date: Tue, 31 Aug 2021 10:40:24 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.1
Content-Language: en-US
To: Larry.Finger@lwfinger.net
Cc: gregkh@linuxfoundation.org, phil@philpotter.co.uk,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 straube.linux@gmail.com
From: Michael Straube <straube.linux@gmail.com>
Subject: staging: r8188eu: Switching encryption to use lib80211
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Larry and all,

I'm currently working on adapting patches from the old rtl8188eu driver
that convert the frame de/encrypt functions to use lib80211.

Please let me know if it's not worth.

Thanks,
Michael
