Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF7E2B545;
	Tue, 22 Aug 2023 17:31:24 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-4ff7ecd0a0dso1387407e87.0;
        Tue, 22 Aug 2023 10:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692725483; x=1693330283;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QfKHgUSTtafoCDv9qIGxx5rTmDvawh/uB7wOQLfeuKA=;
        b=Lm7nygwsiSap6Z09Y/8KweIlb6brFubBzcq23SZTWxfuTRXe+8kS4e0IYA410F/OgF
         qC7nrZ1hp+zP6GtYf68mpBc3B/gyxRikAbFZpeko/66y1kZzTKA5KyjjC7nQMFuzuwae
         WLcXo0tKqn1TNQabSXTgFYs42Qihic5AYYfkJmJqZ/HnZjan68yxxNvXYryMaK0kCtF5
         09shWohCJRUizhD28gKpGgjoMSUt+4clMPfBG3l73cDJxLPtpNyIolPJxxdlhExNCX3T
         rGGmOwXDkUcNt8zJqAxzhfiJPRpWZxopd8Cu8r4CHGqZP2wmSg0uD8yJbRSEotXGuZJ6
         V1xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692725483; x=1693330283;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QfKHgUSTtafoCDv9qIGxx5rTmDvawh/uB7wOQLfeuKA=;
        b=J/C3ME0UV76wsPTISy+R1c09DTCUgb/3g9qZ8O3I1papItQxufYN2PKt41yDeZmF13
         E3gCHPh9sOhZmxZ6McUbUNbtCqPs0ibM1YQBK0Md/0ZO3WlFDADUi+aCHjzJCwO2aYqW
         GQ6GuAaPhUS+V3Aw+TLL5odei7uvMuL2uxlGnK7cHIIcJTwk/yA4HbtDwe+ZpEbBP4aF
         AfV/vCTnD1cA1sAQdrorw58PmdzEUHh2P+gqvHsdDpIl+NWW31EUuBR0QV2cLLPtRuQy
         KjD3mvOcJemK4Gp9U8IDDrjzhg/3XxD+M8NYGPBlssiJft9YMMHcg0NsgfvzQKnRDYJb
         hU+A==
X-Gm-Message-State: AOJu0YzbhcEBaYnFlHI75tXPDqSU2eOHyJ4JiD3QdXBcl0gZ3uCxpTGc
	9bFVgpnInu3oEmi41kx8TdA=
X-Google-Smtp-Source: AGHT+IFKsA5y+4A45gtr4oOX0jTZC3l4FhZV7lIud8i/1g+uNYS7PKF7EUvH1WKUiZXGy9HenbYx+g==
X-Received: by 2002:a19:f81a:0:b0:4fb:9477:f713 with SMTP id a26-20020a19f81a000000b004fb9477f713mr5925771lff.6.1692725482596;
        Tue, 22 Aug 2023 10:31:22 -0700 (PDT)
Received: from [192.168.0.100] (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id x20-20020a05600c2a5400b003fef60005b5sm4049810wme.9.2023.08.22.10.31.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Aug 2023 10:31:22 -0700 (PDT)
Message-ID: <e5eb5935-5219-4d43-892b-96a03f8eb755@gmail.com>
Date: Tue, 22 Aug 2023 19:31:21 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] staging: vt6655: replace camel case by snake case
Content-Language: en-US
To: Pavan Bobba <opensource206@gmail.com>,
 Forest Bond <forest@alittletooquiet.net>,
 Michael Straube <straube.linux@gmail.com>, outreachy@lists.linux.dev
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <ZOTUCRICU6lSYfdn@ubuntu.myguest.virtualbox.org>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <ZOTUCRICU6lSYfdn@ubuntu.myguest.virtualbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/22/23 17:28, Pavan Bobba wrote:
> Replace formal arguments of few functions and local variables of camel case by snake case.
> Issue found by checkpatch
> 
> Signed-off-by: Pavan Bobba<opensource206@gmail.com>

Hi,

please find a unique subject so that we see it is something new.

Thanks

Bye Philipp
