Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71746442D;
	Sun,  2 Apr 2023 16:00:07 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id i5so108344552eda.0;
        Sun, 02 Apr 2023 09:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680451205; x=1683043205;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j6lbVzylHSD1bkwqF+EEh8vp3rCF+fULXBoCye8hbUI=;
        b=oT3hW/sIwwMuZlR7SThF3UUX3oUtfKDo9uiBq3hqWEZJ8TBfOfLq4pkxl1obxYQDBI
         OseLrkQA/pUcaiPM/nwn2FK5a9AxbTkcy63hrcdQa7Kw1AeLpZ0h+RlQtbbnt2b5Tshm
         WGbIeWLGsu/cI0O9EJ6xM//TLbCcWXFMpMvNBjwiw1rpVk7LEroXiZZX5Ku22aO0Fxcc
         HBLdPlkuraleN0fC0khsQ+yblRFJqoDaJ0XSwORO4R9zIXSQA5a6YlnLYT+k7dGh9Kd9
         mgbkZBTw/xJh+nmoPozDal+wl/zqzDY5vAMvRh+O3rUiLjQX0ChfGKWsgcPis8XfzC1L
         OvAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680451205; x=1683043205;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j6lbVzylHSD1bkwqF+EEh8vp3rCF+fULXBoCye8hbUI=;
        b=dNXNGgi3fZb3ZWMW0PVG+8ywz2UaUwLk7n+zl/zqUrJJaMvAC5WWMW6o/KlErbRJ3Z
         DxEYn/DftaWq9+Z24SGTGOuiWN22KDleG8HZgu33Xq8GrU1Xfxi6LYY8FmBiXv+onOOg
         V8NAYFYLpn0r72E8TWXmsvWVMx0las3L3/CC9S9TWWWONEkuHXmQ1JhZc2ZGTHm3yUGr
         THLTgWDSXgHO6a9JETuug6qFnsyFvSDFk/EWC//s6sNOBw6wGPYa5iV1e7AVC8JQ23I+
         AgKgLbnZeGAWsf2LDLqc9V6649WcEgxeIhJ9LOhZVWOGRREfUwFaGD4Ot/KRJBQCZTZt
         Rr+g==
X-Gm-Message-State: AAQBX9duWYBUjWuMEzYGaeh0aljEbVztvYKQlUYma8HQz5DgZ+KSZsJH
	6JnBjayOOUmYtSYB7jf+ak4=
X-Google-Smtp-Source: AKy350brr9ZcZTZfYr38J1LydLHUvz8vf6PleV3OLbnjTdr5uVSjVgjB/czCAO0bqxm5nTG8iwvmJw==
X-Received: by 2002:a17:906:1c4:b0:931:5145:c51f with SMTP id 4-20020a17090601c400b009315145c51fmr6452359ejj.4.1680451205506;
        Sun, 02 Apr 2023 09:00:05 -0700 (PDT)
Received: from [192.168.0.102] (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id b10-20020a1709065e4a00b0093dbb008281sm3354798eju.130.2023.04.02.09.00.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Apr 2023 09:00:04 -0700 (PDT)
Message-ID: <91cc4474-8991-6762-841e-8936d3bb66d2@gmail.com>
Date: Sun, 2 Apr 2023 18:00:03 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 0/5] staging: rtl8192e: fix checkpatch issues in
 rtllib_crypt_ccmp.c
To: Khadija Kamran <kamrankhadijadj@gmail.com>, outreachy@lists.linux.dev
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <cover.1680445545.git.kamrankhadijadj@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <cover.1680445545.git.kamrankhadijadj@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/2/23 16:32, Khadija Kamran wrote:
> Fix several issues reported by checkpatch in rtllib_crypt_ccmp.c file.
> 
> Changes in v2:
>   - Update variable_name in PATCH 3, 4 and 5 to dot11rsna_{variable_name}
>   - Remove comment from PATCH 3
> 
> Khadija Kamran (5):
>    staging: rtl8192e: remove extra blank lines in rtllib_crypt_ccmp.c
>    staging: rtl8192e: fix alignment to match open parenthesis
>    staging: rtl8192e: avoid CamelCase <dot11RSNAStatsCCMPFormatErrors>
>    staging: rtl8192e: avoid CamelCase <dot11RSNAStatsCCMPReplays>
>    staging: rtl8192e: avoid CamelCase <dot11RSNAStatsCCMPDecryptErrors>
> 
>   drivers/staging/rtl8192e/rtllib_crypt_ccmp.c | 32 +++++++-------------
>   1 file changed, 11 insertions(+), 21 deletions(-)
> 
Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
