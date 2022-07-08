Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5308E817
	for <linux-staging@lists.linux.dev>; Fri,  8 Jul 2022 12:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657284554;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BXuSFlnIAxgCKPnUJ6Nag3HqR+rDg0TljYkgtGxjjVs=;
	b=Tb93t91mimvMq4XeLlj2mlzbf00dHAOvgBAmINMeV5Y8KPDd8g43xty87aMRKlmW8NY9qD
	DZY5Hmt34Mq837gT3wwImj1ZC48i/iQotfVvdEfRJSH/AP0QyPaX5O0gqphLcxYUrsyBsH
	OGklt5kic7sZ0dDwb2T1ZLx6xiIs38k=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-ln92umzdMTq6mhwZomQO7A-1; Fri, 08 Jul 2022 08:49:13 -0400
X-MC-Unique: ln92umzdMTq6mhwZomQO7A-1
Received: by mail-wr1-f70.google.com with SMTP id h29-20020adfaa9d000000b0021d67fc0b4aso3080510wrc.9
        for <linux-staging@lists.linux.dev>; Fri, 08 Jul 2022 05:49:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=BXuSFlnIAxgCKPnUJ6Nag3HqR+rDg0TljYkgtGxjjVs=;
        b=YBWYS8Non8jbSzO1vPkr0BwGOAFN6V9c1zyDVsNkvtWSCnbzzmnEkMOJ5wnSI6GUSk
         HZhCnQCahH1JMyT3/cCblfnF8cex2HL38Wy3RRdjV7nSS8VA7efSn5LTOknz9EuXrD4f
         vGx4pGg/0aRpSCu8xOuozM9HNXp4m8m4HScw/TcxFOvnOf374U0sQF5OVVSpysJoTz4S
         3pFSnXtD05vuhsLnJalgsHZJYqsTysp37FsVjcozoL293otdZcLlPDhIyMFnFq4tnBuR
         kTF2hASQHlbxGYYufUGvBn75mpkF+4hQKGitJoj6xhZvnzOR2+eRwFsn7NzEnbBWHebD
         56CQ==
X-Gm-Message-State: AJIora+4m7C3bU1PjOqE1CB8RdfyuDcjOdK3xKNSPQ7K6YDiKKCxLZLU
	fE1ba3zfu8sAqZjO+zz5nRY8bzuqv4nXlWFpNj2IFg8DrNlSIheC7iDzGXToePnYd2oKZqevECn
	hNyhTqYGXO9SvhDOlwHhw9KsfQg==
X-Received: by 2002:adf:fcc8:0:b0:21d:68dc:814 with SMTP id f8-20020adffcc8000000b0021d68dc0814mr3198819wrs.102.1657284551971;
        Fri, 08 Jul 2022 05:49:11 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sXhd4T+yl5DMha3tRNDB/4iD3FiLVQoWs6+jCF56wa3Ebe+y62zjBioLN+cSMTshk3KpQlpg==
X-Received: by 2002:adf:fcc8:0:b0:21d:68dc:814 with SMTP id f8-20020adffcc8000000b0021d68dc0814mr3198802wrs.102.1657284551803;
        Fri, 08 Jul 2022 05:49:11 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id j2-20020adfff82000000b0021a56cda047sm3218629wrr.60.2022.07.08.05.49.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Jul 2022 05:49:11 -0700 (PDT)
Message-ID: <3d80d394-0aea-8bfa-defa-af2b3c3784c1@redhat.com>
Date: Fri, 8 Jul 2022 14:49:10 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 01/11] fbdev: Remove trailing whitespaces
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, daniel@ffwll.ch,
 sam@ravnborg.org, maxime@cerno.tech
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 dri-devel@lists.freedesktop.org
References: <20220707153952.32264-1-tzimmermann@suse.de>
 <20220707153952.32264-2-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220707153952.32264-2-tzimmermann@suse.de>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello Thomas,

On 7/7/22 17:39, Thomas Zimmermann wrote:
> Fix coding style. No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

