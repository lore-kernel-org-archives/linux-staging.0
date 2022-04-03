Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA887A;
	Sun,  3 Apr 2022 16:16:14 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id b21so2591988lfb.5;
        Sun, 03 Apr 2022 09:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to;
        bh=IgtAeZTQuNIa9y3vwgxr//chaauIDEBJQtopnOwTxf4=;
        b=E458HEUBWZfmfR+luit7HwR2waRN/yZo+jmNIrF0m2lR0ej+sIuFUMxq/rwldRPrCr
         T/2gRZtgYtcI6tzNHtZDnRjWWFiad1tlWpCw/Y8QEeQwN3D2UvDq3lRocKfTCPA81qAc
         mqDgsrkqfRVaYhpJqlrQSPu00dIo/y9AFnwJEazArzu/HA1YjRG6nAkspoUcuIhH2/CD
         D9X1ZETDuJi6YHPjDddzWvun07fBvoLEZSeXxA+NFQSKHfML5C0ZBhHXLukdWBK6UXZ7
         DuaWdniCHLIAIFqIkXCvZmALtdV6OPdyi0NT+PpSvuBFAEg9RO68/4rNdCtRJZyDuipN
         HctQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to;
        bh=IgtAeZTQuNIa9y3vwgxr//chaauIDEBJQtopnOwTxf4=;
        b=RwtC8FKDdLISGqHGqg840MIQGUf9Wg94GWACo6RjcWzqg8jhwThjUESBzwxoGAQo6Q
         yjktbTi8PIF3oHrNfw5vtgr9UWv77tY0icHHRwxAujT1jhXO9MJpQGt9KoKa1daGo8+g
         cwWoX5Iv4McfmU1q+84wtxYFYs7htBbyKPltBEkp3UzdFkeTTFYileOx6wQq42+BVyST
         CeQO1pFY56jv70hQUK7C0EjnFJpfu00vG4n6xYnaBa8jJRG9lpgr8f2jBm5/0tAaDNcR
         vaZK16+JvCqdmk8PvEN302w6r7g2KnaY7c3/INbfPpDktd3XsSemb6CbS6wSfZtaIH1K
         HL2w==
X-Gm-Message-State: AOAM531O37xAN9KC/nwdY0tLD3jeurcSFkUFD36WXiI8OMxgIwVGO4Y9
	TumQ1NjjLJm7ZkT4uW1/xFk=
X-Google-Smtp-Source: ABdhPJz316ecGmF83YClGNQ/6k8qgckPw2Y53KWHlACTaqvIV+oZ7xqdXFsSvev18+B8275OvRCQyQ==
X-Received: by 2002:a05:6512:1108:b0:44a:4ad0:433a with SMTP id l8-20020a056512110800b0044a4ad0433amr20086232lfg.16.1649002572173;
        Sun, 03 Apr 2022 09:16:12 -0700 (PDT)
Received: from [192.168.1.11] ([46.235.67.247])
        by smtp.gmail.com with ESMTPSA id cf19-20020a056512281300b0044aee581708sm484694lfb.261.2022.04.03.09.16.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Apr 2022 09:16:11 -0700 (PDT)
Message-ID: <4ccc9ac3-c542-cd32-0cbb-7cdabbf0dbf9@gmail.com>
Date: Sun, 3 Apr 2022 19:16:10 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] staging: r8188eu: simplify control flow
Content-Language: en-US
To: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 outreachy@lists.linux.dev
References: <20220403155111.GA333187@euclid>
 <ed0e9f7b-9ba9-b0c8-8261-397bf793b9b9@gmail.com>
 <CAMWRUK6K77KpRkCkruL=RQcmA1opbvapyPJOA-EFpYdXxY8ujQ@mail.gmail.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <CAMWRUK6K77KpRkCkruL=RQcmA1opbvapyPJOA-EFpYdXxY8ujQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------HP4oSgxHM6RwE5D0K0e7s0Hx"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------HP4oSgxHM6RwE5D0K0e7s0Hx
Content-Type: multipart/mixed; boundary="------------tysZAGg9x0vZfgtw07lIyWLA";
 protected-headers="v1"
From: Pavel Skripkin <paskripkin@gmail.com>
To: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 outreachy@lists.linux.dev
Message-ID: <4ccc9ac3-c542-cd32-0cbb-7cdabbf0dbf9@gmail.com>
Subject: Re: [PATCH] staging: r8188eu: simplify control flow
References: <20220403155111.GA333187@euclid>
 <ed0e9f7b-9ba9-b0c8-8261-397bf793b9b9@gmail.com>
 <CAMWRUK6K77KpRkCkruL=RQcmA1opbvapyPJOA-EFpYdXxY8ujQ@mail.gmail.com>
In-Reply-To: <CAMWRUK6K77KpRkCkruL=RQcmA1opbvapyPJOA-EFpYdXxY8ujQ@mail.gmail.com>

--------------tysZAGg9x0vZfgtw07lIyWLA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgU2V2aW5qLA0KDQpPbiA0LzMvMjIgMTk6MTIsIFNldmluaiBBZ2hheWV2YSB3cm90ZToN
Cj4+DQo+PiBMb29rcyBnb29kLCBidXQgbGV0J3Mgbm90IGludHJvZHVjZSBuZXcgY2hlY2tw
YXRjaCBpc3N1ZToNCj4+DQo+PiBDSEVDSzogQWxpZ25tZW50IHNob3VsZCBtYXRjaCBvcGVu
IHBhcmVudGhlc2lzDQo+PiAjNjI6IEZJTEU6IGRyaXZlcnMvc3RhZ2luZy9yODE4OGV1L2Nv
cmUvcnR3X21sbWUuYzoxNjQ1Og0KPj4gKyAgICAgICAgICAgICAgIGlmICgocC0+UE1LSURM
aXN0W2ldLmJVc2VkKSAmJg0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAo
IW1lbWNtcChwLT5QTUtJRExpc3RbaV0uQnNzaWQsIGJzc2lkLCBFVEhfQUxFTikpKQ0KPiAN
Cj4gVGhhbmtzIGZvciBjYXRjaGluZyB0aGlzLiBJIHdhc24ndCBzZWVpbmcgdGhpcyBpbiBt
eSBjaGVja3BhdGNoDQo+IG91dHB1dCwgYW5kIGFmdGVyIHNvbWUgZGlnZ2luZywgSSBjb3Vs
ZCByZXByb2R1Y2UgaXQgd2l0aCAtLXN0cmljdA0KPiBvcHRpb24uIEkgdGhpbmsgdGhlIHR1
dG9yaWFsIGF0DQo+IGh0dHBzOi8va2VybmVsbmV3Ymllcy5vcmcvUGF0Y2hQaGlsb3NvcGh5
IGRvZXNuJ3QgbWVudGlvbiB0aGlzIG9wdGlvbiwNCj4gc28gcGVyaGFwcyB3ZSBzaG91bGQg
dXBkYXRlIGl0PyENCj4gDQoNClRvIGJlIGhvbmVzdCwgSSBhbSBub3QgY2hlY2twYXRjaCBl
eHBlcnQsIGJ1dCBjaGVja3BhdGNoIG9uIG15IFBDIHNob3dzIA0KdGhpcyB3YXJuaW5nIHcv
byBhbnkgYWRkaXRpb25hbCBvcHRpb25zOg0KDQrilJTilIDilIAkIC4vc2NyaXB0cy9jaGVj
a3BhdGNoLnBsIA0KLi8yMDIyMDQwM19zZXZpbmpfYWdoYXlldmFfc3RhZ2luZ19yODE4OGV1
X3NpbXBsaWZ5X2NvbnRyb2xfZmxvdy5tYnggfCANCnJnIEFsaWdubWVudA0KQ0hFQ0s6IEFs
aWdubWVudCBzaG91bGQgbWF0Y2ggb3BlbiBwYXJlbnRoZXNpcw0KDQoNCg0KDQoNCldpdGgg
cmVnYXJkcywNClBhdmVsIFNrcmlwa2luDQo=

--------------tysZAGg9x0vZfgtw07lIyWLA--

--------------HP4oSgxHM6RwE5D0K0e7s0Hx
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEER3XL3TplLQE8Qi40bk1w61LbBA0FAmJJyEoFAwAAAAAACgkQbk1w61LbBA1C
iRAAoGKkJt1QrQCFV7f6v0yLrMlVv+z66aRtV0/0n5YqG522/V+oCSEbn9UkMBn3U1X4J9nJ+Ny1
Ge9p0MsD3nxv5nT0m7mcmpNRBV/kM2diTwzqNMf+G3Ey2hiSN69gjIWwIlgH2uKi27p794+zwrrd
tNxNqqBxnt2OGUWPISikzZOoAVJg69TuycX6uaGsco1b37NW02FcWOutIibwOqUfob7xGAnvfLQ1
YoBbC9kwp3ziVtJjogJIT92LqRvYNfO5gzcsW5U+WKm/IdnOCYkXwgNk9OTA8hysX98ocztsI+Mc
U7jWzJ2HFG01bMP5mjiTVoa7UNL/yc39dI99rIyxbvnca0SSws5JRY8gRyo1l2z+KhnieMXtCvo7
XSs0tjinQ4KMf0Cwesnt00TkFhDm0ewrNW0r4z3k/4TyRINZSsFNlWUAXBiKpLDNRFLuQd+LxA35
I2djBgmjRmnJ3EoL9QRA4Iq9T5K3I3gTrn9Yo5e/EOBpWrx3Tv0UolA/SFDhb4NSf7xLzoQoopuV
J8JD07k4MiBTQ5AZtUovhxk2enIogqjdW1iY1S/I0l+FdaJ6qyh2HstxNOLN7B4sn3QxGuiE24Ip
FJbMpkE4cy1MbG/t1ZgS5YFrLvlv5zNS2LsZrM+1LZFchl6rSUlo74eF8gnftJ5Htu8ryU7Rd+Jv
fsA=
=fLX7
-----END PGP SIGNATURE-----

--------------HP4oSgxHM6RwE5D0K0e7s0Hx--
