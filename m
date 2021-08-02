Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89467168
	for <linux-staging@lists.linux.dev>; Mon,  2 Aug 2021 18:51:37 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id 68-20020a9d0f4a0000b02904b1f1d7c5f4so18423507ott.9
        for <linux-staging@lists.linux.dev>; Mon, 02 Aug 2021 11:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=svJkIty/ZqVJuJga9dG1X+yiI53hTyzCIsAln5flC+8=;
        b=GTHm/zAFffONfXf4W1Ae3Q8OLLoD0T4iJrG0lU46iafYHvH8YEZ2O5qsMTWKnLwWBj
         XUo6YN+dz8Y+dQ97xLNAhp3dDDtMzcsScYTsL6jmOs03jMf3+/LqmY5/T89wbTTOY9HY
         uzHJhJHsrFbnplpmBxkBpjX6+8d55j7DloqkRTOqXB2WgyR8S/04unyVXylBS83KEIsx
         5UDh1QOYeSgM3F6HVnR7ciiOQN3JIPZw+KAiHuCWOezWm44fSvt4rUKqmWgb4Rc/E8MG
         4ayVxJkM/UI0oZLEPB0sZAf8Meh3zff69gOZhlmyRP81DjzW/TdGamdD8wPQxtpUD94g
         HdhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=svJkIty/ZqVJuJga9dG1X+yiI53hTyzCIsAln5flC+8=;
        b=jiH0ZuCXZrG+0+AoXf4hP5/ec+tiJMfNWOv5zNJbrotKTofSCYMUK1Sn3XYdSp+gHb
         jH7kTs6DeCBPHbpoNb6avzZenn+DKBQ7Ko89raDa1M5VcJsq5t4LaJN9RW31UGINAaFh
         q3lvjLbTegsKykSoV2aSbFF7PygmeCSZg2Y5QTXk2Wc6NG+kt3hbnntH39AOn8uuPYqi
         Y2522y9DAm0YTk5wTImNWz5qqzobNxBpVMGB+ujAWFwSkBP8WKv/xJ1dmDvtxeLaBoii
         4fBuRoNB6inJJcEyr3Q5C7OG1kejs0T5CfBN32ROx490IZ2yl7US0vBxGG0ixIePpXKX
         vMYw==
X-Gm-Message-State: AOAM531HepbbtxIWsTaCJ1sdjf99i7vPa51tUDqg3IuoJRGd6sjHTbSp
	loRlDON8JK3iFj+wmIkB3m8=
X-Google-Smtp-Source: ABdhPJzE+iW32I6J61bigAlcYHMc2+WyKCDzFS2Id18o32GCEqIbeDaNjjfj73FeNr8csZuCxGIyAA==
X-Received: by 2002:a05:6830:1be2:: with SMTP id k2mr12503576otb.285.1627930296849;
        Mon, 02 Aug 2021 11:51:36 -0700 (PDT)
Received: from 2603-8090-2005-39b3-0000-0000-0000-100a.res6.spectrum.com (2603-8090-2005-39b3-0000-0000-0000-100a.res6.spectrum.com. [2603:8090:2005:39b3::100a])
        by smtp.gmail.com with ESMTPSA id y22sm873744oie.27.2021.08.02.11.51.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Aug 2021 11:51:35 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Subject: Re: [PATCH 0/6] Clean up some extraneous wrappers and some empty
 routines
To: Fabio Aiuto <fabioaiuto83@gmail.com>
Cc: gregkh@linuxfoundation.org, phil@philpotter.co.uk,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20210802151546.31797-1-Larry.Finger@lwfinger.net>
 <20210802171947.GA1405@agape.jhs>
From: Larry Finger <Larry.Finger@lwfinger.net>
Message-ID: <185d72dc-e916-0ac0-9a79-9927395f6078@lwfinger.net>
Date: Mon, 2 Aug 2021 13:51:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210802171947.GA1405@agape.jhs>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/2/21 12:19 PM, Fabio Aiuto wrote:
> what these .rej files are?
> 

A mistake on my part. I will resubmit

Larry

