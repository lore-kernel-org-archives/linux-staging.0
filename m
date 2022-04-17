Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A5D29B2;
	Sun, 17 Apr 2022 20:16:41 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id bu29so21630431lfb.0;
        Sun, 17 Apr 2022 13:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to;
        bh=TX8zh/3mZWRKWsKznABT9xhmhyChqdlG/z1f87PASz0=;
        b=TUYzSB7m/pjZkFBnH1c5tU/zm3kNSZiEYP1SGwC9oPc/VWfEuBLqQ20RZ1Y3VeNQK3
         rgT9dQq8IV+V+uViBxmzMoeGKoD0uG4sbeJ//n9x7qxWByg/CdpAJxDaEo2srNv8e/U5
         I3qMnTaAn2e61F7N2IWQGssE27XNFRZ5hjp0l6yIzyHfUkFPE4pHRJKXDa8SONnmarjA
         1+edZ19hODsca0wsMxIrvHzdXx0nzizO/JgJZX0Zt2baA6mtHf8zzXIodsRe2oNCxiPs
         30ds+oyIusT5uH5iEqOfPzwdbKqSSjDTw6jOquIlA4JLKf7xu6m302piaDsXB1juzRIp
         wK8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to;
        bh=TX8zh/3mZWRKWsKznABT9xhmhyChqdlG/z1f87PASz0=;
        b=pdDjdMHoxziQE2oPLBBvN3GePCdPCGodhJ9FlkhMQj60lbGlDJvFDqwQi8i3Tn6Smc
         RyWfl2qflSf6AsizWi5mKVe1l8W2vYPnF5FXJV4GGypy8uRUpyOJIQNOc0S9yjnpy3fj
         n9L0Y2UIdt045qfcL+7gENkeK2Hlwl/gb5fxumFm2iC7Q0aMhVEVMF4Lu0B77gUezoeD
         7gMyUAV+0Nb23uR+WgrihKEY3ZWsduPWw4u2WL0CLGUG8Da5gt3JgRVw1bCERaXVnJr9
         /vcJtkEFDseWZip6pI0blfvdiXqSkidbXrN+BV4HKmyZT6mEGpSKk471q4wSNOh2avhx
         shgg==
X-Gm-Message-State: AOAM531fyModRP8f4ZxNEE5bvSRZgkug/BX0DdgisyPbgdRjjT//Ajnk
	D0DFYj7RPG5iLPSH+A4fiYA=
X-Google-Smtp-Source: ABdhPJy6nOOjd66wFL1Q9xgO3LZa0ZswJpL/3uK1QI4Wp1Qcgf91ZV00KNubf2Y/V0jl70YCbhxPgw==
X-Received: by 2002:a05:6512:1526:b0:471:44fa:c367 with SMTP id bq38-20020a056512152600b0047144fac367mr3427689lfb.376.1650226599877;
        Sun, 17 Apr 2022 13:16:39 -0700 (PDT)
Received: from [192.168.1.11] ([94.103.225.17])
        by smtp.gmail.com with ESMTPSA id m1-20020a05651202e100b0046cd451b8easm1017044lfq.22.2022.04.17.13.16.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Apr 2022 13:16:39 -0700 (PDT)
Message-ID: <a28f445f-f088-620e-6baf-4cad3e1a8146@gmail.com>
Date: Sun, 17 Apr 2022 23:16:38 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/6] staging: r8188eu: remove unused member
 free_bss_buf
Content-Language: en-US
To: Jaehee Park <jhpark1013@gmail.com>,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
References: <cover.1649990500.git.jhpark1013@gmail.com>
 <e41e0d3b62395d04f41d6934074074c431e7aacc.1649990500.git.jhpark1013@gmail.com>
 <3608313.MHq7AAxBmi@leap>
 <20220417201415.GA233554@jaehee-ThinkPad-X1-Extreme>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20220417201415.GA233554@jaehee-ThinkPad-X1-Extreme>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------nH6u0decmpXWafPdcK1i4ek1"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------nH6u0decmpXWafPdcK1i4ek1
Content-Type: multipart/mixed; boundary="------------Ozug4Ze70dz3120gvEHLGOWQ";
 protected-headers="v1"
From: Pavel Skripkin <paskripkin@gmail.com>
To: Jaehee Park <jhpark1013@gmail.com>,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Message-ID: <a28f445f-f088-620e-6baf-4cad3e1a8146@gmail.com>
Subject: Re: [PATCH v2 1/6] staging: r8188eu: remove unused member
 free_bss_buf
References: <cover.1649990500.git.jhpark1013@gmail.com>
 <e41e0d3b62395d04f41d6934074074c431e7aacc.1649990500.git.jhpark1013@gmail.com>
 <3608313.MHq7AAxBmi@leap>
 <20220417201415.GA233554@jaehee-ThinkPad-X1-Extreme>
In-Reply-To: <20220417201415.GA233554@jaehee-ThinkPad-X1-Extreme>

--------------Ozug4Ze70dz3120gvEHLGOWQ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSmFlaGVlLA0KDQpPbiA0LzE3LzIyIDIzOjE0LCBKYWVoZWUgUGFyayB3cm90ZToNCj4g
TXkgdW5kZXJzdGFuZGluZyBvZiBQYXZlbCdzIHJlc3BvbnNlIGlzIHRoZSBmcmVlX2Jzc19i
dWYgbWVtYmVyIG9mIHRoZQ0KPiBwbWxtZXByaXYgc3RydWN0dXJlIHdhc24ndCBiZWluZyB1
c2VkIGFueXdoZXJlIGFuZCB0aGF0IHRoZQ0KPiBydHdfZnJlZV9tbG1lX3Jpdl9pZV9kYXRh
IGZ1bmN0aW9uIGZyZWVzIHRoZSBtZW1vcnkgb2YgdGhlIHBtbG1lcHJpdg0KPiBzdHJ1Y3R1
cmUgc28gdGhlIHNlY29uZCBjaGVjayBpcyByZWR1bmRhbnQuDQo+IA0KPiBIb3dldmVyLCBh
cyBGYWJpbyBzYWlkLCB0aGUgZnJlZV9ic3NfYnVmIG1lbWJlciBpcyBiZWluZyB1c2VkIGFu
ZCBwYnVmDQo+IG1lbW9yeSBpcyBub3QgYmVpbmcgZnJlZWQuDQo+IFNvIEknbGwgcmV2ZXJ0
IHRoZSBwYXRjaCBhcyBpdCB3YXMgb3JpZ2luYWxseSAod2hpY2ggd2FzIGp1c3QgcmVtb3Zp
bmcNCj4gdGhlIHt9IGFyb3VuZCB0aGUgc2luZ2xlIGlmIHN0YXRlbWVudCkuDQo+IA0KDQpX
aHkganVzdCBgcGJ1ZmAgYWxsb2NhdGlvbiBjYW4ndCBiZSByZW1vdmVkPyBUaGlzIG1lbW9y
eSBpcyBqdXN0IHVudXNlZCwgDQppc24ndCBpdD8NCg0KDQoNCg0KV2l0aCByZWdhcmRzLA0K
UGF2ZWwgU2tyaXBraW4NCg==

--------------Ozug4Ze70dz3120gvEHLGOWQ--

--------------nH6u0decmpXWafPdcK1i4ek1
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEER3XL3TplLQE8Qi40bk1w61LbBA0FAmJcdaYFAwAAAAAACgkQbk1w61LbBA3l
Aw//ULThNHysaIck86TFAUvZ5qKlbZ8At2fGE2odUmUYL+zwMKsMxiJYRh2TbASDEg/8KxsxYY5G
67M042ILhUXZrb3FRsurNzURzF43fz+u2L5fSyYArN1U1mUN3q6tY5H/FLmqIargxv5lYItuT3l9
RvI6JD09W7XCPMA18YtyENdb53nGng/bFdcBdK/ANndHzYc8EGaSFQjYR/buB3rXTwFA1XGBQDMZ
LUNbzP8seAC5j6ahyw2fUUphtKjhaeD+AZbatCaXzNSh0t8jRlpH/AXZtic26MyNQpWeMbXjVRUf
hdh/xM8xacgTJUXXICwEUGLmtT6pIXzN0mxkhbuAYtjEbBhdR1rZcYxT+3g2RIPZB5uX/SGhIBfp
M5X34d5ebNGkRtf+atW3zEcFzzry5YgsgxypoDCEG5SSFgBlhLJpRXVPLW4k0UFgKf+rz50JQpqh
2LLVGvmWlRKV8Fm7Zz7otDsX4u6rZ8O2jDBpQXJHZ1PgNf/Ya3jh6D7mOEQl+UyZTU4nuw6Dncsw
UN9hEWjxbmQh9WzqNIO/urjx6/ASswVi0u7DtiZoVUdCcZYQVHMpEGOwi22bem0+Wt7tehTjUcBl
yxkKST+D0qtV1ljeHusEoJzzmzuG5Dc+vREf2GVftj7Nk98Rgj8xQAWYdkEPZk7IwqQ/NazqxnFX
jns=
=Kl4L
-----END PGP SIGNATURE-----

--------------nH6u0decmpXWafPdcK1i4ek1--
