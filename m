Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2B73FC4
	for <linux-staging@lists.linux.dev>; Fri, 27 Aug 2021 15:00:19 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id u25so4029142oiv.5
        for <linux-staging@lists.linux.dev>; Fri, 27 Aug 2021 08:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sT/hAVYHeCPn8/fKGQ1DHiSzcrL6MJiSLnVodARb2Q8=;
        b=HjBpLuj/UoUOlO6hFvtAFVToOBaUi7QqxzC/nQDwVsoEsqXtXFY5vPd/PaNv+LfyR9
         69fkrXuHRqEpHr5tgbriPozBS/yOzCyJEq6Y2MSc93QuJ+Uj4NrIzT8HbR1I4dGqalcx
         A55Jdwt8bGXtI5DtN5THjvMOd2KuvwnXWtmv4KbqAgss2abuROzmgFG+ytllVPWy2cid
         WYDC/0FFXy0MDjp6F1h1Y9/oVMhBU2XjNXOsG0NmrDhUHUt0HgsdVXJFAaK1VIWgBPwc
         Ti1Dr55ZtF/MazuiHilp7FQ0NkNA0iPANXKZ1gS6VLj+djSG19TeKHX9XSbWp56S8r+X
         CkoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sT/hAVYHeCPn8/fKGQ1DHiSzcrL6MJiSLnVodARb2Q8=;
        b=mEnQpKQVPZIENv2R4UcZiKd72q9bpi6vpZ7ZcMVs2ZTNRTY3DGI6fLQ9MVP3UiUeMq
         RKc6ARs5pwPIOJg+nQjddyXtPKCfSgelUdye5sHsP9OkrJcvQozwUNESw3rwNQd2xrBc
         s/Eq2xKMWuQjQyP56/axaxmvdIGvzCJlfmLAC99/RxBa/C2nocHke0e2CpwfRVVn5MCO
         dLvCTRwfOwdPLvn/2UQPo7EXhuk+Y638ZbJeF1OcyX+3dOHceDhiq3rbxae9oEiUzvUT
         v2zkzbq0oBOG0s68avmAq7el7/81A4OY4qTSTAw+3bLJvWVybYGeX1b+DiSrLZWbwhVV
         dqRA==
X-Gm-Message-State: AOAM5327i57nKCTtahiDMjW5IxgIX8qdWPcx90DO7kNXYOvoEllaZNLX
	nNxfb5exKlWW5cDgGg1jcz4=
X-Google-Smtp-Source: ABdhPJyu07+t3J1QHJc05g5iW4JLWt5tqlj0fzuN2ahTLzdFoMEm7/4Pp0qXheDgfx0Tq4v4IfFO8Q==
X-Received: by 2002:a05:6808:a09:: with SMTP id n9mr14831598oij.67.1630076418892;
        Fri, 27 Aug 2021 08:00:18 -0700 (PDT)
Received: from 2603-8090-2005-39b3-0000-0000-0000-1023.res6.spectrum.com (2603-8090-2005-39b3-0000-0000-0000-1023.res6.spectrum.com. [2603:8090:2005:39b3::1023])
        by smtp.gmail.com with ESMTPSA id y66sm1431987oia.12.2021.08.27.08.00.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Aug 2021 08:00:18 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Subject: Re: [PATCH v3] staging: r8188eu: Provide a TODO file for this driver
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 gregkh@linuxfoundation.org, phil@philpotter.co.uk,
 Fabio Aiuto <fabioaiuto83@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>
References: <20210827100813.18610-1-fmdefrancesco@gmail.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
Message-ID: <a6265f77-cc21-878e-4980-272202fa5415@lwfinger.net>
Date: Fri, 27 Aug 2021 10:00:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210827100813.18610-1-fmdefrancesco@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/27/21 5:08 AM, Fabio M. De Francesco wrote:
> +* Switch to use LIB80211.
> +* Switch to use MAC80211.

You totally ignored my comment of yesterday!!!!! The driver will be converted to 
use CFG80211 - not eirher of those you quote, unless you are planning to convert 
to use mac80211. I am not.

Larry

